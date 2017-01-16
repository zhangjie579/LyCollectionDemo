//
//  LyMainChooseBtn.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyMainChooseBtn.h"
#import "ButtonWithTitleLeft.h"

@interface LyMainChooseBtn ()

@property(nonatomic,strong)NSMutableArray *arrays;
@property(nonatomic,strong)NSMutableArray *array_name;
@end

@implementation LyMainChooseBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        
        for (NSInteger i = 0; i < self.array_name.count; i++)
        {
            [self addBtnWithImage:[NSString stringWithFormat:@"recomand_%ld",i + 10] title:self.array_name[i] tag:i];
        }
    }
    return self;
}

- (void)btnClick:(ButtonWithTitleLeft *)btn
{
    
}

- (void)addBtnWithImage:(NSString *)image title:(NSString *)title tag:(NSInteger)tag
{
    ButtonWithTitleLeft *btn = [[ButtonWithTitleLeft alloc] init];
    btn.titlePosition = 4;
    btn.titleScale = 0.3;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:11];
    btn.backgroundColor = [UIColor whiteColor];
    btn.tag = tag;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    [self.arrays addObject:btn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (NSInteger i = 0; i < self.arrays.count; i++)
    {
        ButtonWithTitleLeft *btn = self.arrays[i];
        
        NSInteger x = i % 4;
        NSInteger y = i / 4;
        CGFloat w = 50;
        CGFloat h = 70;
        CGFloat lineW = ([UIScreen mainScreen].bounds.size.width - w * 4) / 5;
        
        btn.frame = CGRectMake(lineW + (lineW + w) * x, (h + 10) * y, w, h);
    }
}

- (NSMutableArray *)arrays
{
    if (!_arrays) {
        _arrays = [[NSMutableArray alloc] init];
    }
    return _arrays;
}

- (NSMutableArray *)array_name
{
    if (!_array_name) {
        _array_name = [[NSMutableArray alloc] initWithObjects:@"最新发布",@"大人街拍",@"爆款",@"经典款",@"品牌热卖",@"国际秀场",@"无与伦比",@"打折", nil];
    }
    return _array_name;
}

@end
