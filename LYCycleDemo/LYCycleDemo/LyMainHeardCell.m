//
//  LyMainHeardCell.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyMainHeardCell.h"
#import "ADPlayView.h"
#import "Masonry.h"
#import "LyMainChooseBtn.h"

@interface LyMainHeardCell ()

@property(nonatomic,strong)ADPlayView *playView;
@property(nonatomic,strong)LyMainChooseBtn *btn_choose;

@end

@implementation LyMainHeardCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPth:(NSIndexPath *)indexPth
{
    static NSString *ID = @"LyMainHeardCell";
    
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:ID];
    
    return [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPth];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self.contentView addSubview:self.playView];
        [self.contentView addSubview:self.btn_choose];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.playView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(120);
    }];
    
    [self.btn_choose mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.playView.mas_bottom).with.offset(10);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(160);
        
    }];
}

- (ADPlayView *)playView
{
    if (!_playView) {
        _playView = [[ADPlayView alloc] init];
        _playView.array_icon = @[@"recomand_01",@"recomand_02",@"recomand_03",@"recomand_04",@"recomand_05"];
    }
    return _playView;
}

- (LyMainChooseBtn *)btn_choose
{
    if (!_btn_choose) {
        _btn_choose = [[LyMainChooseBtn alloc] init];
    }
    return _btn_choose;
}

@end
