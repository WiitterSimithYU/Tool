//
//  ZTMyCustomCollectionView.m
//  Tools
//
//  Created by 孙东日 on 2017/11/30.
//  Copyright © 2017年 孙东日. All rights reserved.
//

#import "ZTMyCustomCollectionView.h"
#import "ZTCCCell.h"
#import "ZTCCLayout.h"
static NSString * cellMark = @"itemCell";
@implementation ZTMyCustomCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        [self setCollectionViewLayout:self.myLayout];
        [self registerNib:[UINib nibWithNibName:@"ZTCCCell" bundle:nil] forCellWithReuseIdentifier:cellMark];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma -mark CollectionView Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _itemArry.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZTCCCell *cell = (ZTCCCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellMark forIndexPath:indexPath];
    cell.itemTitle.text=_itemArry[indexPath.row];
    cell.layer.cornerRadius = 10;
    cell.cellColor = [UIColor greenColor];
    return cell;
}

#pragma mark - WaterFlowLayoutDelegate
-(CGSize)waterFlowLayout:(ZTCCLayout *)WaterFlowLayout heightForWidth:(CGFloat)width andIndexPath:(NSIndexPath *)indexPath{
    return [self getSize:_itemArry[indexPath.row]];
}

- (CGSize)getSize:(NSString *)str{
    UIFont *font=[UIFont systemFontOfSize:30];
    NSDictionary *attrs=@{NSFontAttributeName:font};
    CGSize mySize=[str sizeWithAttributes:attrs];
    return mySize;
}
-(void)getCollectionViewHeight:(CGFloat)ccHeight{
    [self.delegte getTableCellHeight:ccHeight];
}


-(void)setItemArry:(NSMutableArray *)itemArry{
    _itemArry = itemArry;
}

-(ZTCCLayout*)myLayout{
    if (_myLayout==nil) {
        _myLayout = [[ZTCCLayout alloc] init];
        _myLayout.columnCount = 4;
        _myLayout.rowMargin = 2;
        _myLayout.columnMargin=2;
        _myLayout.sectionInset=UIEdgeInsetsMake(2, 2, 2, 2);
        _myLayout.delegate=self;
    }
    return _myLayout;
}

@end
