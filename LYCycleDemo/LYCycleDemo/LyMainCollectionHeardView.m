//
//  LyMainCollectionHeardView.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyMainCollectionHeardView.h"
#import "Masonry.h"

@interface LyMainCollectionHeardView ()

@property(nonatomic,strong)UIImageView *logo;
@property(nonatomic,strong)UILabel     *label;

@end

@implementation LyMainCollectionHeardView

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPth:(NSIndexPath *)indexPth
{
    static NSString *ID = @"LyMainCollectionHeardView";
    
    [collectionView registerClass:[self class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ID];
    
    return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ID forIndexPath:indexPth];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.logo];
        [self addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self.logo.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(200, 40));
    }];
}

- (UIImageView *)logo
{
    if (!_logo) {
        _logo = [[UIImageView alloc] init];
        _logo.image = [UIImage imageNamed:@"recomand_02"];
    }
    return _logo;
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont systemFontOfSize:15];
        _label.textAlignment=  NSTextAlignmentLeft;
        _label.text = @"图片展示";
    }
    return _label;
}

@end
