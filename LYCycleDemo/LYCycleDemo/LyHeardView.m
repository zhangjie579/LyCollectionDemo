//
//  LyHeardView.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyHeardView.h"
#import "Masonry.h"

@interface LyHeardView ()

@property(nonatomic,strong)UIView *view_line;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSMutableArray *array_label;
@property(nonatomic,strong)NSMutableArray *array_name;
@end

@implementation LyHeardView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.scrollView];
        for (NSInteger i = 0; i < self.array_name.count; i++)
        {
            [self addLabel:self.array_name[i] tag:i];
        }
        [self.scrollView addSubview:self.view_line];
    }
    return self;
}

- (void)willMoveToWindow:(UIWindow *)newWindow
{
    if (newWindow)
    {
        [self.scrollView_bottom addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (![keyPath isEqualToString:@"contentOffset"] || object != self.scrollView_bottom)
    {
        return;
    }
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat x = self.scrollView_bottom.contentOffset.x;
    
    //注意:这里加0.5是为了避免往左一点label就去上一个了
    NSInteger num = x / w + 0.5;
    
    if (num * 80 <= w / 2)//小于半屏不移动
    {
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }
    else
    {
        CGFloat contentX = num * 80 - w / 2;
        //求出最大的可滑动范围
        CGFloat maxW = self.array_label.count * 80 - w;
        
        if (contentX >= maxW)
        {
            contentX = maxW;
        }
        
        self.scrollView.contentOffset = CGPointMake(contentX, 0);
    }
    
    for (NSInteger i = 0; i < self.array_label.count; i++)
    {
        UILabel *label = self.array_label[i];
        if (i == num)
        {
            label.textColor = [UIColor redColor];
        }
        else
        {
            label.textColor = [UIColor blackColor];
        }
    }
    self.view_line.frame = CGRectMake(num * 80, 45, 80, 5);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(80 * self.array_name.count, 50);
    
    for (NSInteger i = 0; i < self.array_label.count; i++)
    {
        UILabel *label = self.array_label[i];
        label.frame = CGRectMake(80 * i, 0, 80, 50);
    }
    
    self.view_line.frame = CGRectMake(0, 45, 80, 5);
}

- (void)tapClick:(UITapGestureRecognizer *)tap
{
    UILabel *label = (UILabel *)tap.view;
//    label.tag;
    if ([self.delegate respondsToSelector:@selector(lyHeardViewDidTapLable:)]) {
        [self.delegate lyHeardViewDidTapLable:label.tag];
    }
}

- (void)addLabel:(NSString *)title tag:(NSInteger)tag
{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.userInteractionEnabled = YES;
    label.tag = tag;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [label addGestureRecognizer:tap];
    [self.scrollView addSubview:label];
    [self.array_label addObject:label];
}

- (UIView *)view_line
{
    if (!_view_line) {
        _view_line = [[UIView alloc] init];
        _view_line.backgroundColor = [UIColor redColor];
    }
    return _view_line;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (NSMutableArray *)array_label
{
    if (!_array_label) {
        _array_label = [[NSMutableArray alloc] init];
    }
    return _array_label;
}

- (NSMutableArray *)array_name
{
    if (!_array_name) {
        _array_name = [[NSMutableArray alloc] initWithObjects:@"最新发布",@"大人街拍",@"爆款",@"经典款",@"品牌热卖",@"国际秀场",@"无与伦比",@"打折", nil];
    }
    return _array_name;
}

@end
