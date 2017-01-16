//
//  ADPlayView.m
//  020
//
//  Created by bona on 16/10/11.
//  Copyright © 2016年 bona. All rights reserved.
//
#define ID @"abc"
#define maxN 1000

#import "ADPlayView.h"
#import "ShowImageCell.h"
#import "ADCollectionViewFlowLayout.h"

@interface ADPlayView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView           *collectionView;
@property (nonatomic, strong) ADCollectionViewFlowLayout *layout;
@property (nonatomic, strong) UIPageControl              *pageControl;
@property (nonatomic, strong) NSTimer                    *timer;

@end

@implementation ADPlayView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.collectionView];
        [self.collectionView registerClass:[ShowImageCell class] forCellWithReuseIdentifier:ID];
        [self addSubview:self.pageControl];
    }
    return self;
}

- (void)setArray_icon:(NSArray *)array_icon
{
    _array_icon = array_icon;
    
    self.pageControl.numberOfPages = array_icon.count;
    
    [self.collectionView reloadData];
    
    //作用：当主线程任务完成后才会执行这些代码
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //1.让collectionView默认滑动到第二组
        NSIndexPath *index = [NSIndexPath indexPathForRow:array_icon.count inSection:0];
        
        [self.collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        
        //2.添加定时器
        [self addTimer];
    });
}

-(void)addTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}
-(void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)nextImage
{
    //0.得到当前页数
    NSInteger x = self.collectionView.contentOffset.x / self.collectionView.frame.size.width;
    
    // 1.增加pageControl的页码
    NSInteger page = 0;
    if (x == self.array_icon.count * maxN - 1)
    {
        page = 0;
        [self.collectionView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    else
    {
        page = x + 1;
        
        // 2.计算scrollView滚动的位置
        CGFloat offsetX = page * self.collectionView.frame.size.width;
        [self.collectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    }
}

/**
 *  当scrollView正在滚动就会调用
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    float i = scrollView.contentOffset.x / scrollView.frame.size.width;
    int j = (float)(i + 0.5);
    
    self.pageControl.currentPage = j % self.array_icon.count;
}

/**
 *  开始拖拽的时候调用
 */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}

/**
 *  减速停止的时候开始执行
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger x = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    NSLog(@"width   %f",scrollView.frame.size.width);
    NSLog(@"x    %ld",x);
    
    //1.在第1张的时候，让他滑动到第array.count张
    if (x == 0)
    {
        [self.collectionView setContentOffset:CGPointMake(self.array_icon.count * self.collectionView.frame.size.width, 0) animated:NO];
    }
    
    //2.在最后1张得时候，让它滑动到第array.count - 1张
    if (x == self.array_icon.count * maxN - 1)
    {
        [self.collectionView setContentOffset:CGPointMake((self.array_icon.count - 1) * self.collectionView.frame.size.width, 0) animated:NO];
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
#warning  * maxN 避免到最后一张图的时候滑动卡顿
    return self.array_icon.count * maxN;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShowImageCell *cell = (ShowImageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ShowImageCell alloc] init];
    }
    
    cell.imageView.image = [UIImage imageNamed:self.array_icon[indexPath.row % self.array_icon.count]];
    
    return cell;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.collectionView.frame = self.bounds;
    
    self.pageControl.frame = CGRectMake((self.bounds.size.width - 20) / 2, self.bounds.size.height - 20, 20, 20);
}


- (ADCollectionViewFlowLayout *)layout
{
    if (!_layout) {
        _layout = [[ADCollectionViewFlowLayout alloc] init];
    }
    return _layout;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.userInteractionEnabled = NO;
    }
    return _pageControl;
}

@end
