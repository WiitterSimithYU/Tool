//
//  ZTMyCustomCollectionView.h
//  Tools
//
//  Created by 孙东日 on 2017/11/30.
//  Copyright © 2017年 孙东日. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTCCLayout.h"
@protocol ZTCollectionViewTableCellDelegate <NSObject>

-(void)getTableCellHeight:(CGFloat)ccHeight;
@end

@interface ZTMyCustomCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,ZTCustomLayoutDelegate>
@property (nonatomic,strong) id<ZTCollectionViewTableCellDelegate>delegte;
@property (strong, nonatomic) NSMutableArray *itemArry;
@property (strong, nonatomic) ZTCCLayout * myLayout;

@end
