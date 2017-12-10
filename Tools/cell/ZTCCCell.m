//
//  ZTCCCell.m
//  Tools
//
//  Created by 孙东日 on 2017/11/29.
//  Copyright © 2017年 孙东日. All rights reserved.
//

#import "ZTCCCell.h"

@implementation ZTCCCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

-(void)setCellColor:(UIColor *)cellColor{
    _itemTitle.layer.backgroundColor = cellColor.CGColor;
    [_itemTitle setTextColor:[UIColor blackColor]];
    _itemTitle.layer.cornerRadius = 2;
}
@end
