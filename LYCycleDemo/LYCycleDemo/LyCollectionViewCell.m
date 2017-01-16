//
//  LyCollectionViewCell.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyCollectionViewCell.h"
#import "Masonry.h"

@interface LyCollectionViewCell ()

@property(nonatomic,strong)UIImageView *logo;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView      *view_image;
@property(nonatomic,strong)NSMutableArray *arrays;

@end

@implementation LyCollectionViewCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPth:(NSIndexPath *)indexPth
{
    static NSString *ID = @"LyCollectionViewCell";
    
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:ID];
    
    return [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPth];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self.contentView addSubview:self.logo];
        [self.contentView addSubview:self.scrollView];
        [self.scrollView addSubview:self.view_image];
        
        for (NSInteger i = 0; i < 5; i++)
        {
            [self addImage:[NSString stringWithFormat:@"recomand_0%ld",i + 5]];
        }
    }
    return self;
}

- (void)addImage:(NSString *)name
{
    UIImageView *image = [[UIImageView alloc] init];
    image.image = [UIImage imageNamed:name];
    [self.view_image addSubview:image];
    [self.arrays addObject:image];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.logo mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(120);
    }];
    
    [self.scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.logo.mas_bottom);
        make.height.mas_equalTo(80);
    }];
    
    [self.view_image mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.scrollView);
        make.width.mas_equalTo(540);
    }];
    
    for (NSInteger i = 0; i < self.arrays.count; i++)
    {
        UIImageView *image = self.arrays[i];
        image.frame = CGRectMake(10 + 90 * i, 10, 80, 60);
    }
}

- (UIImageView *)logo
{
    if (!_logo) {
        _logo = [[UIImageView alloc] init];
        _logo.image = [UIImage imageNamed:@"recomand_15"];
    }
    return _logo;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIView *)view_image
{
    if (!_view_image) {
        _view_image = [[UIView alloc] init];
        _view_image.backgroundColor = [UIColor whiteColor];
    }
    return _view_image;
}

- (NSMutableArray *)arrays
{
    if (!_arrays) {
        _arrays = [[NSMutableArray alloc] init];
    }
    return _arrays;
}

@end
