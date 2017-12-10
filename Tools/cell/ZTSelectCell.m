//
//  ZTSelectCell.m
//  Tools
//
//  Created by 孙东日 on 2017/11/29.
//  Copyright © 2017年 孙东日. All rights reserved.
//

#import "ZTSelectCell.h"

@implementation ZTSelectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCustomSelect:(BOOL)customSelect{
    if (customSelect) {
        self.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}
@end
