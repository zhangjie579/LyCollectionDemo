//
//  ViewController.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "ViewController.h"
#import "LyView.h"
#import "LyHeardView.h"

@interface ViewController ()<LyHeardViewDelegate>

//@property(nonatomic,strong)LyView *lyView;
@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)LyHeardView *heardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [UIApplication sharedApplication].statusBarHidden = YES;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.heardView];
    [self.view addSubview:self.scrollView];
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    
    for (NSInteger i = 0; i < 8; i++)
    {
        LyView *lyView = [[LyView alloc] init];
        lyView.frame = CGRectMake(w * i, 0, w, [UIScreen mainScreen].bounds.size.height - 50);
        [self.scrollView addSubview:lyView];
    }
}

//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

//点击标签的回调
- (void)lyHeardViewDidTapLable:(NSInteger)tag
{
    [self.scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * tag, 0) animated:YES];
}

- (LyHeardView *)heardView
{
    if (!_heardView) {
        _heardView = [[LyHeardView alloc] init];
        _heardView.scrollView_bottom = self.scrollView;
        _heardView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
        _heardView.delegate = self;
    }
    return _heardView;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 50);
        _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 8, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;//滑动到边缘无弹性
    }
    return _scrollView;
}

@end
