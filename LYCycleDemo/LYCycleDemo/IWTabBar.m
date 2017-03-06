//
//  IWTabBar.m
//  037
//
//  Created by 张杰 on 16/3/12.
//  Copyright (c) 2016年 张杰. All rights reserved.
//
// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

#import "IWTabBar.h"
#import "IWTabBarButton.h"
//#import "UIImage+MJ.h"

@interface IWTabBar()
@property (nonatomic, strong) NSMutableArray *tabBarButtons;


@property (nonatomic, weak) IWTabBarButton *selectedButton;
@end

@implementation IWTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        if (!iOS7) { // 非iOS7下,设置tabbar的背景
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
        }
    }
    return self;
}

-(void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    IWTabBarButton *btn = [[IWTabBarButton alloc] init];
    [self addSubview:btn];
    [self.tabBarButtons addObject:btn];
    btn.item = item;
    
    //监听点击
    [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    //设置初始值
    if (self.tabBarButtons.count == 1) {
        [self btnclick:btn];
    }
}

-(void)btnclick:(IWTabBarButton *)btn
{
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
    //delegate
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:btn.tag];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = self.tabBarButtons.count;
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    for (int i = 0; i < count; i++) {
        IWTabBarButton *btn = self.tabBarButtons[i];
        CGFloat btnw = w / count;
        btn.frame = CGRectMake(i * btnw, 0, btnw, h);
        btn.tag = i;
    }
}
-(NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [[NSMutableArray alloc] init];
    }
    return _tabBarButtons;
}
@end
