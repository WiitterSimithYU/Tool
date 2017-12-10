//
//  ZTSelectItemTableController.m
//  Tools
//
//  Created by 孙东日 on 2017/11/29.
//  Copyright © 2017年 孙东日. All rights reserved.
//

#import "ZTSelectItemTableController.h"
#import "ZTSelectCell.h"
static NSString *cellMark = @"select";
@interface ZTSelectItemTableController ()
{
    ZTSelectCell *cells;
    NSMutableArray *selectItemArra;
}
@property (nonatomic,strong) NSMutableArray *itemArray;
@end

@implementation ZTSelectItemTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZTSelectCell" bundle:nil] forCellReuseIdentifier:cellMark];
    self.tableView.allowsMultipleSelection = YES;
    _itemArray = [NSMutableArray arrayWithArray:@[@"嘻哈",@"电子",@"R&B",@"爵士",@"流行",@"欧美",@"摇滚",@"日韩",@"布鲁斯",@"金属",@"轻音乐",@"古典",@"乡村",@"校园民谣",@"60年代经典",@"80年代经典",@"王菲",@"周杰伦",@"陈奕迅",@"王力宏",@"萧敬腾",@"五月天",@"6月天",@"7月天",@"8月天",@"9月天",@"10月天",@"11月天"]];
    selectItemArra = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZTSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:cellMark forIndexPath:indexPath];
    for (NSIndexPath *path in selectItemArra) {
        if (path.section==indexPath.section && path.row==indexPath.row) {
            cell.customSelect=YES;
        }
    }
     cell.customSelect=NO;
     cell.itemTitle.text = [_itemArray objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    cells=[tableView cellForRowAtIndexPath:indexPath];
    //显示选择过的 cell

    //cells.customSelect=cells.customSelect?NO:YES;
    if (cells.accessoryType==UITableViewCellAccessoryCheckmark) {
        for (int i=0;i<selectItemArra.count;i++) {
            NSIndexPath *path=selectItemArra[i];
            if (path.section==indexPath.section && path.row==indexPath.row) {
                [selectItemArra replaceObjectAtIndex:i withObject:indexPath];
            }
        }
         [selectItemArra removeObject:indexPath];
         cells.customSelect=NO;
        cells.accessoryType=UITableViewCellAccessoryNone;
    }
    else{
         [selectItemArra addObject:indexPath];
         cells.customSelect=YES;
         cells.accessoryType=UITableViewCellAccessoryCheckmark;
    }
    _dataModel.titleName = [_itemArray objectAtIndex:indexPath.row];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    for (NSIndexPath *keepindexPath in selectItemArra) {
        [self.tableView cellForRowAtIndexPath:keepindexPath].accessoryType=UITableViewCellAccessoryCheckmark;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
