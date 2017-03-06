//
//  IWTabBarViewController.m
//  037
//
//  Created by 张杰 on 16/3/12.
//  Copyright (c) 2016年 张杰. All rights reserved.
//

// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

#import "IWTabBarViewController.h"
#import "IWDiscoverViewController.h"
#import "IWNavigationController.h"
//#import "UIImage+MJ.h"
#import "IWTabBar.h"
#import "LyMainViewController.h"
#import "ViewController.h"
#import "LyMyMainViewController.h"

@interface IWTabBarViewController ()<IWTabBarDelegate>
/**
 *  自定义的tabbar
 */
@property (nonatomic, strong) IWTabBar *customTabBar;

@end

@implementation IWTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化tabbar
    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)setupTabbar
{
    [self.tabBar addSubview:self.customTabBar];
}
-(void)tabBar:(IWTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}

-(void)setupAllChildViewControllers
{
    // 1.首页
    LyMainViewController *home = [[LyMainViewController alloc] init];
    [self setupChildViewController:home title:@"首页" imageName:@"apply_ic_login_qq" selectedImageName:@"apply_ic_login_qq"];
    
    // 2.消息
    ViewController *message = [[ViewController alloc] init];
    [self setupChildViewController:message title:@"消息" imageName:@"apply_ic_login_wechat" selectedImageName:@"apply_ic_login_wechat"];
    message.tabBarItem.badgeValue = @"10";
    
    // 3.广场
    IWDiscoverViewController *discover = [[IWDiscoverViewController alloc] init];
    [self setupChildViewController:discover title:@"好奇心" imageName:@"apply_ic_login_weibo" selectedImageName:@"apply_ic_login_weibo"];
    
    // 4.我
    LyMyMainViewController *me = [[LyMyMainViewController alloc] init];
    [self setupChildViewController:me title:@"我" imageName:@"apply_bottom_ic_comments" selectedImageName:@"apply_bottom_ic_comments"];
    me.tabBarItem.badgeValue = @"";
}

- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (iOS7) {
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = selectedImage;
    }
    
    IWNavigationController *nav = [[IWNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

-(IWTabBar *)customTabBar
{
    if (_customTabBar == nil) {
        _customTabBar = [[IWTabBar alloc] init];
        _customTabBar.frame = self.tabBar.bounds;
        _customTabBar.delegate = self;
    }
    return _customTabBar;
}
@end
