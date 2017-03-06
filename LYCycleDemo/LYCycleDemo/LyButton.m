//
//  LyButton.m
//  LyBottomBtnDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyButton.h"

@interface LyButton ()

@property(nonatomic,assign)CGFloat lastY;

@end

@implementation LyButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.lastY = 0;
        [self setImage:[UIImage imageNamed:@"apply_bottom_course"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    if (newSuperview) {
//        [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
        [self.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
}

- (void)dealloc
{
    [self.scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (![keyPath isEqualToString:@"contentOffset"] || object != self.scrollView)
    {
        return;
    }
    
    CGPoint point = [change[@"new"] CGPointValue];
    
    if (point.y - 20 > self.lastY)//向上滑动
    {
//        self.hidden = YES;
        [UIView animateWithDuration:0.2 animations:^{
            self.transform = CGAffineTransformIdentity;
        }];
    }
    
    if (self.lastY - 20 > point.y)//避免反弹
    {
//        self.hidden = NO;
        [UIView animateWithDuration:0.2 animations:^{
            self.transform = CGAffineTransformMakeTranslation(0, -70);
        }];
    }
    
    if (point.y <= 0 && point.y >= -100)
    {
//        self.hidden = NO;
        [UIView animateWithDuration:0.2 animations:^{
            self.transform = CGAffineTransformMakeTranslation(0, -70);
        }];
    }
    
    self.lastY = point.y;
    
    NSLog(@"%f",point.y);
}

@end
