//
//  LyFlowLayout.m
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import "LyFlowLayout.h"

@implementation LyFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.itemSize = CGSizeMake(self.collectionView.frame.size.width, 200);
    
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.minimumLineSpacing = 0;
    
    self.minimumInteritemSpacing = 10;
    
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
