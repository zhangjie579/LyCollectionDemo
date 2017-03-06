//
//  LyShowView.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/17.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyShowView.h"

@interface LyShowView ()

@property(nonatomic,strong)UIVisualEffectView *effectView;

@end

@implementation LyShowView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {

        [self addSubview:self.effectView];
        
        
    }
    return self;
}

/*注：尽量避免将UIVisualEffectView对象的alpha值设置为小于1.0的值，
 因为创建半透明的视图会导致系统在离屏渲染时去对UIVisualEffectView对象
 及所有的相关的子视图做混合操作。这不但消耗CPU/GPU，也可能会导致许多效果
 显示不正确或者根本不显示。*/
- (UIVisualEffectView *)effectView
{
    if (!_effectView) {
        _effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _effectView.frame = CGRectMake(0, 0, ScreenWidth,  ScreenHeight);
        _effectView.layer.cornerRadius = 5;
        _effectView.clipsToBounds = YES;
    }
    return _effectView;
}

@end
