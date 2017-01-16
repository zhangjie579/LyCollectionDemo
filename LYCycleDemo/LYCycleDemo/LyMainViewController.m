//
//  LyMainViewController.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height

#import "LyMainViewController.h"
#import "LyMainFlowLayout.h"
#import "LyMainCollectionViewCell.h"
#import "LyMainHeardCell.h"
#import "LyMainCollectionHeardView.h"

@interface LyMainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)LyMainFlowLayout *flowLayout;

@end

@implementation LyMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
}

- (void)initView
{
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    
    [self addMasonry];
}

- (void)addMasonry
{
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1)
    {
        return 20;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        LyMainHeardCell *cell = [LyMainHeardCell cellWithCollectionView:collectionView indexPth:indexPath];
        
        return cell;
    }
    else if (indexPath.section == 1)
    {
        LyMainCollectionViewCell *cell = [LyMainCollectionViewCell cellWithCollectionView:collectionView indexPth:indexPath];
        cell.indexPath = indexPath;
        
        return cell;
    }
    return nil;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:@"UICollectionElementKindSectionHeader"])
    {
        LyMainCollectionHeardView *heardView = [LyMainCollectionHeardView cellWithCollectionView:collectionView indexPth:indexPath];
        return heardView;
    }
    
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        return CGSizeMake(screenW, 50);
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return CGSizeMake(self.collectionView.frame.size.width, 290);
    }
    else if (indexPath.section == 1)
    {
        return CGSizeMake(self.collectionView.frame.size.width / 2, 120);
    }
    return CGSizeZero;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH - 64) collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (LyMainFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[LyMainFlowLayout alloc] init];
    }
    return _flowLayout;
}

@end
