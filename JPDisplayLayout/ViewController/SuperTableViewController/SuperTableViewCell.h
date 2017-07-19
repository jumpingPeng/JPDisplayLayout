//
//  SuperTableViewCell.h
//  DisplayLayout
//
//  Created by 贾鹏 on 2016/7/19.
//  Copyright © 2016年 贾鹏. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "TestDataModel.h"
@interface SuperTableViewCell : UITableViewCell
- (void)configCellData:(TestDataModel *)model;
@end
