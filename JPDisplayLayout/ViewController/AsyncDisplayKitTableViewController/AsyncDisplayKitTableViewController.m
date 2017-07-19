//
//  AsyncDisplayKitTableViewController.m
//  DisplayLayout
//
//  Created by 贾鹏 on 2016/7/19.
//  Copyright © 2016年 贾鹏. All rights reserved.
//


#import "AsyncDisplayKitTableViewController.h"
#define CELL_REUSE_ID @"AsyncDisplayKitTableViewCell"
@interface AsyncDisplayKitTableViewController ()

@end

@implementation AsyncDisplayKitTableViewController

- (void)viewDidLoad {
    self.title = @"AsyncDisplayKit";
    [super viewDidLoad];
    
}



#pragma mark - Override Super Method
- (NSString *)getReuseIdentifier {
    return CELL_REUSE_ID;
}

@end
