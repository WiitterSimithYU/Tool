//
//  ZTCCLayout.h
//  Tools
//
//  Created by 孙东日 on 2017/11/30.
//  Copyright © 2017年 孙东日. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ZTCCLayout;
@protocol ZTCustomLayoutDelegate <NSObject>

-(CGSize)waterFlowLayout:(ZTCCLayout *) WaterFlowLayout heightForWidth:(CGFloat)width andIndexPath:(NSIndexPath *)indexPath;
-(void)getCollectionViewHeight:(CGFloat)ccHeight;
@end
@interface ZTCCLayout : UICollectionViewLayout

@property (nonatomic)id<ZTCustomLayoutDelegate>delegate;
@property (assign,nonatomic)CGFloat columnMargin;//每一列item之间的间距
@property (assign,nonatomic)CGFloat rowMargin;   //每一行item之间的间距
@property (assign,nonatomic)UIEdgeInsets sectionInset;//设置于collectionView边缘的间距
@property (assign,nonatomic)NSInteger columnCount;//设置每一行排列的个数
@end
