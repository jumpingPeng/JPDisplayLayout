//
//  FrameCountTableViewController.m
//  DisplayLayout
//
//  Created by 贾鹏 on 2016/7/19.
//  Copyright © 2016年 贾鹏. All rights reserved.
//


#import "FrameCountTableViewController.h"
#import "FrameLayoutTableViewCell.h"

#define CELL_REUSE_ID @"FrameLayoutTableViewCell"

@interface FrameCountTableViewController ()

@end

@implementation FrameCountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FrameLayoutCountHeight";
    // Do any additional setup after loading the view.
}

#pragma mark - Override Super Method
- (NSString *)getReuseIdentifier {
    return CELL_REUSE_ID;
}

@end
