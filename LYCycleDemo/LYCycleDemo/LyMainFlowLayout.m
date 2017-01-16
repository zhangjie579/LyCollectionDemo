//
//  LyMainFlowLayout.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyMainFlowLayout.h"

@implementation LyMainFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
//    self.itemSize = CGSizeMake(self.collectionView.frame.size.width / 2, 120);
    
    
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.minimumLineSpacing = 10;
    
    self.minimumInteritemSpacing = 0;
    
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    
//}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    
//}

@end
