//
//  LyView.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyView.h"
#import "LyFlowLayout.h"
#import "LyCollectionViewCell.h"

@interface LyView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)LyFlowLayout *flowLayout;
@property(nonatomic,strong)UICollectionView *collectionView;

@end

@implementation LyView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.collectionView];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LyCollectionViewCell *cell = [LyCollectionViewCell cellWithCollectionView:collectionView indexPth:indexPath];
    
    return cell;
}

- (LyFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[LyFlowLayout alloc] init];
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 50) collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

@end
