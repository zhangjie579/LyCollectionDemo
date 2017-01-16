//
//  ButtonWithTitleLeft.h
//  IbonaOA
//
//  Created by bona on 16/8/12.
//  Copyright © 2016年 博纳. All rights reserved.
//  按钮，可以自己定位title的位置和所占的比例

#import <UIKit/UIKit.h>

@interface ButtonWithTitleLeft : UIButton

/**  title所占按钮大小的   “比例”  ,如果不传的话默认是0.7  */
@property(nonatomic,assign)CGFloat titleScale;
/**  title在按钮中的位置1.左，2.右，3.上，4.下，必须传  */
@property(nonatomic,assign)NSInteger titlePosition;//1.左，2.右，3.上，4.下
@end
