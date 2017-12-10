//
//  ZTMainController.m
//  Tools
//
//  Created by 孙东日 on 2017/11/29.
//  Copyright © 2017年 孙东日. All rights reserved.
//

#import "ZTMainController.h"
#import "ZTMainCell.h"
#import "ZTSelectItemTableController.h"
#import "ZTDataModel.h"
#import "ZTCollectionViewTableCell.h"
#import "ZTMyCustomCollectionView.h"

static NSString *cellMark = @"main";
static NSString *collectionCell = @"collectionCell";
@interface ZTMainController ()
@property (nonatomic,strong)ZTDataModel *dm;
@property (nonatomic,strong) NSMutableArray *itemTitleArra;
@property (nonatomic) BOOL changeValue;
@property (nonatomic) CGFloat tableViewHeight;
@property (nonatomic,strong) ZTMyCustomCollectionView *myCustomCollectionView;
@end

@implementation ZTMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTable.delegate=self;
    self.mainTable.dataSource=self;
    self.mainTable.estimatedRowHeight =100;
    self.mainTable.rowHeight = UITableViewAutomaticDimension;
    [self.mainTable registerNib:[UINib nibWithNibName:@"ZTMainCell" bundle:nil] forCellReuseIdentifier:cellMark];
    [self.mainTable registerNib:[UINib nibWithNibName:@"ZTCollectionViewTableCell" bundle:nil] forCellReuseIdentifier:collectionCell];
    _dm = [[ZTDataModel alloc] init];
    [_dm addObserver:self forKeyPath:@"titleName" options:NSKeyValueObservingOptionNew context:nil];
    _itemTitleArra = [NSMutableArray array];
    _changeValue=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
}

-(ZTMyCustomCollectionView*)myCustomCollectionView{
    if (_myCustomCollectionView==nil) {
        UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc] init];
        _myCustomCollectionView = [[ZTMyCustomCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:fl];
        _myCustomCollectionView.delegte=self;
    }
    return _myCustomCollectionView;
}

#pragma mark - tableview 显示数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_changeValue) {
        ZTCollectionViewTableCell *collectionViewTableCell = [tableView dequeueReusableCellWithIdentifier:collectionCell forIndexPath:indexPath];
        self.myCustomCollectionView.itemArry = _itemTitleArra;
        [self.myCustomCollectionView setFrame:CGRectMake(0, 0, collectionViewTableCell.titleCollection.frame.size.width, collectionViewTableCell.frame.size.height)];
        [collectionViewTableCell.titleCollection addSubview:self.myCustomCollectionView];
        return collectionViewTableCell;
    }
    else{
     ZTMainCell *cell = [tableView dequeueReusableCellWithIdentifier:cellMark forIndexPath:indexPath];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor redColor];
    cell.mainLb.text=@"我喜欢的电影";
    cell.mainLb.numberOfLines = 0;
        return cell;
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *vv = [[UIView alloc] init];
    return vv;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZTSelectItemTableController *itemTableController = [[ZTSelectItemTableController alloc] initWithNibName:@"ZTSelectItemTableController" bundle:nil];
    itemTableController.dataModel=_dm;
    [_itemTitleArra removeAllObjects];
    [self.navigationController pushViewController:itemTableController animated:YES];
}

// KVO回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"titleName"]) {
        NSMutableArray *arr = [NSMutableArray arrayWithArray:_itemTitleArra];
        if ([_itemTitleArra containsObject:[_dm valueForKey:@"titleName"]]) {
            for (NSString *str in arr) {
                if ([str isEqualToString:[_dm valueForKey:@"titleName"]]) {
                    [_itemTitleArra removeObject:str];
                }
            }
        }
        else{
                    [_itemTitleArra addObject:[_dm valueForKey:@"titleName"]];
        }
        if (_itemTitleArra.count>0) {
            _changeValue=YES;
        }
        else{
            _changeValue=NO;
        }
        [self.myCustomCollectionView removeFromSuperview];
        self.myCustomCollectionView=nil;
        [self.mainTable reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        NSLog(@"%@",_itemTitleArra);
        //继续别的
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_changeValue) {
        return self.tableViewHeight;
    }
    else{
        return 44;
    }
}

-(void)getTableCellHeight:(CGFloat)ccHeight{
     self.tableViewHeight=ccHeight;
     [self.myCustomCollectionView reloadData];
     [self.mainTable reloadData];
}

@end
