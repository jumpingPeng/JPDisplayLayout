//
//  CountHeightTableViewController.m
//  DisplayLayout
//
//  Created by 贾鹏 on 2016/7/19.
//  Copyright © 2016年 贾鹏. All rights reserved.
//


#import "CountHeightTableViewController.h"
#define CELL_REUSE_ID @"AutolayoutTableViewCell"
@interface CountHeightTableViewController ()
@end

@implementation CountHeightTableViewController


#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AutoLayoutCountHeight";
}

#pragma mark - UITableViewDelegate

#pragma mark - Override Super Method
- (NSString *)getReuseIdentifier {
    return CELL_REUSE_ID;
}

@end
