//
//  ButtonWithTitleLeft.m
//  IbonaOA
//
//  Created by bona on 16/8/12.
//  Copyright © 2016年 博纳. All rights reserved.
//

#define scale 0.7

#import "ButtonWithTitleLeft.h"

@interface ButtonWithTitleLeft ()

@property (nonatomic,assign) CGFloat titleW;
@property (nonatomic,assign) NSInteger titleposi;//1.左，2.右，3.上，4.下
@end

@implementation ButtonWithTitleLeft

-(instancetype)init
{
    if (self = [super init]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (self.titleW == 0) {
        self.titleW = scale;
    }
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    switch (self.titleposi) {//1.左，2.右，3.上，4.下
        case 1:
        {
            w = contentRect.size.width * self.titleW;
            h = contentRect.size.height;
        }
            break;
        case 2:
        {
            x = contentRect.size.width * (1 - self.titleW);
            w = contentRect.size.width * self.titleW;
            h = contentRect.size.height;
        }
            break;
        case 3:
        {
            w = contentRect.size.width;
            h = contentRect.size.height * self.titleW;
        }
            break;
        case 4:
        {
            y = contentRect.size.height * (1 - self.titleW);
            w = contentRect.size.width;
            h = contentRect.size.height * self.titleW;
        }
            break;
            
        default:
            break;
    }
    
    return CGRectMake(x, y, w, h);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.titleW == 0) {
        self.titleW = scale;
    }
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    switch (self.titleposi) {
        case 1:
        {
            x = contentRect.size.width * self.titleW;
            w = contentRect.size.width * (1 - self.titleW);
            h = contentRect.size.height;
        }
            break;
        case 2:
        {
            w = contentRect.size.width * (1 - self.titleW);
            h = contentRect.size.height;
        }
            break;
        case 3:
        {
            y = contentRect.size.height * self.titleW;
            w = contentRect.size.width;
            h = contentRect.size.height * (1 - self.titleW);
        }
            break;
        case 4:
        {
            w = contentRect.size.width;
            h = contentRect.size.height * (1 - self.titleW);
        }
            break;
            
        default:
            break;
    }
    
    return CGRectMake(x, y, w, h);
}

-(void)setTitleScale:(CGFloat)titleScale
{
    _titleScale = titleScale;
    
    if (titleScale != 0) {
        self.titleW = titleScale;
    }else
        self.titleW = scale;
}

-(void)setTitlePosition:(NSInteger)titlePosition
{
    _titlePosition = titlePosition;
    
    self.titleposi = titlePosition;
}

@end
