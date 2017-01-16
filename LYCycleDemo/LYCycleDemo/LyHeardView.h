//
//  LyHeardView.h
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LyHeardViewDelegate <NSObject>

@optional
- (void)lyHeardViewDidTapLable:(NSInteger)tag;
@end

@interface LyHeardView : UIView

@property(nonatomic,strong)UIScrollView *scrollView_bottom;
@property(nonatomic,weak)id<LyHeardViewDelegate>delegate;

@end
