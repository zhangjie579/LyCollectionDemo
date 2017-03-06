//
//  IWTabBar.h
//  037
//
//  Created by 张杰 on 16/3/12.
//  Copyright (c) 2016年 张杰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IWTabBar;

@protocol IWTabBarDelegate <NSObject>

@optional
-(void)tabBar:(IWTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;
@end
@interface IWTabBar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property(nonatomic,weak)id<IWTabBarDelegate>delegate;
@end
