//
//  MainTableViewController.m
//  DisplayLayout
//
//  Created by 贾鹏 on 2016/7/19.
//  Copyright © 2016年 贾鹏. All rights reserved.
//


#import "MainTableViewController.h"


@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)tapFirstButton:(id)sender {
    [self pushVC:@"AutolayoutTableViewController"];
}
- (IBAction)tapSecondButton:(id)sender {
    [self pushVC:@"CountHeightTableViewController"];
}
- (IBAction)tapThridButton:(id)sender {
    [self pushVC:@"FrameCountTableViewController"];
}
- (IBAction)tapFourthButton:(id)sender {
    [self pushVC:@"YYKitTableViewController"];
}
- (IBAction)tapFifthButton:(id)sender {
    [self pushVC:@"AsyncDisplayKitTableViewController"];
}

- (void)pushVC:(NSString *) vcName {
   UITableViewController * vc = [[NSClassFromString(vcName) alloc] init];
   [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
