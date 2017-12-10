//
//  ZTMainController.h
//  Tools
//
//  Created by 孙东日 on 2017/11/29.
//  Copyright © 2017年 孙东日. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZTCollectionViewTableCell.h"
#import "ZTMyCustomCollectionView.h"
@interface ZTMainController : UIViewController<UITableViewDelegate,UITableViewDataSource,ZTCollectionViewTableCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainTable;

@end
