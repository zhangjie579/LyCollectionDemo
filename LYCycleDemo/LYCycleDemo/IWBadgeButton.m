//
//  IWBadgeButton.m
//  037
//
//  Created by 张杰 on 16/3/12.
//  Copyright (c) 2016年 张杰. All rights reserved.
//

#import "IWBadgeButton.h"
#import "UIImage+Extension.h"
//#import "NSString+Extension.h"

@implementation IWBadgeButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage resizableImage:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    if (badgeValue) {
        self.hidden = NO;
        [self setTitle:badgeValue forState:UIControlStateNormal];
        // 设置frame
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;

        if (badgeValue.length > 1) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[NSFontAttributeName] = self.titleLabel.font ;
            CGSize badgeSize = [badgeValue sizeWithAttributes:dict];
            badgeW = badgeSize.width + 10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
    }else
    {
        self.hidden = YES;
    }
}
@end
