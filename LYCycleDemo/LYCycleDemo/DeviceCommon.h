//
//  DeviceCommon.h
//  zzy
//
//  Created by 黎敏娴 on 17/1/7.
//  Copyright © 2017年 黄江昆. All rights reserved.
//

#ifndef DeviceCommon_h
#define DeviceCommon_h


#endif /* DeviceCommon_h */
// 是否为iOS7
#define IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)?YES:NO

// 是否为iOS8
#define iOS8 ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0)
// 是否为iOS9
#define iOS9 ([UIDevice currentDevice].systemVersion.doubleValue >= 9.0)
// 是否为iOS10
#define iOS10 ([UIDevice currentDevice].systemVersion.doubleValue >= 10.0)
//屏幕大小尺寸
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

#define StateBarHeight ((IS_IOS_7)?20:0)

#define NavBarHeight ((IS_IOS_7)?64:44)

#define BottomHeight ((IS_IOS_7)?49:49)

//通过三色值获取颜色对象
#define rgb(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
