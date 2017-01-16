//
//  ADCollectionViewFlowLayout.m
//  020
//
//  Created by bona on 16/10/11.
//  Copyright © 2016年 bona. All rights reserved.
//

#import "ADCollectionViewFlowLayout.h"

@implementation ADCollectionViewFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.itemSize = CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumInteritemSpacing = 0;
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.minimumLineSpacing = 0;
}

@end
