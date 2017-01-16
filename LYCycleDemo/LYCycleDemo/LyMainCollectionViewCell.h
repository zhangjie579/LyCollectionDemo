//
//  LyMainCollectionViewCell.h
//  LYCycleDemo
//
//  Created by 张杰 on 2017/1/16.
//  Copyright © 2017年 张杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LyMainCollectionViewCell : UICollectionViewCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPth:(NSIndexPath *)indexPth;

@property(nonatomic,strong)NSIndexPath *indexPath;

@end
