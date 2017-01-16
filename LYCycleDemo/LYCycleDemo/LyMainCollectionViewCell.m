//
//  LyMainCollectionViewCell.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyMainCollectionViewCell.h"
#import "Masonry.h"

@interface LyMainCollectionViewCell ()

@property(nonatomic,strong)UIImageView *logo;
@property(nonatomic,strong)UILabel     *label;
@end

@implementation LyMainCollectionViewCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPth:(NSIndexPath *)indexPth
{
    static NSString *ID = @"LyMainCollectionViewCell";
    
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:ID];
    
    return [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPth];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self.contentView addSubview:self.logo];
        [self.contentView addSubview:self.label];
        
    }
    return self;
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    self.label.text = [NSString stringWithFormat:@"图片   %ld",indexPath.row];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.logo mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).with.offset(10);
        make.right.mas_equalTo(self.contentView).with.offset(-10);
        make.height.mas_equalTo(80);
    }];
    
    [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).with.offset(10);
        make.right.mas_equalTo(self.contentView).with.offset(-10);
        make.top.mas_equalTo(self.logo.mas_bottom).with.offset(10);
        make.height.mas_equalTo(20);
    }];
}

- (UIImageView *)logo
{
    if (!_logo) {
        _logo = [[UIImageView alloc] init];
        _logo.image = [UIImage imageNamed:@"recomand_18"];
    }
    return _logo;
}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor blackColor];
        _label.font = [UIFont systemFontOfSize:15];
        _label.textAlignment=  NSTextAlignmentCenter;
        _label.text = @"图片";
    }
    return _label;
}


@end
