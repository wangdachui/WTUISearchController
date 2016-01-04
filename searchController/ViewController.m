//
//  ViewController.m
//  searchController
//
//  Created by 王涛 on 15/12/28.
//  Copyright © 2015年 王涛. All rights reserved.
//

#import "ViewController.h"
#import "searchResultVC.h"
#import "searchVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    searchVC *vc = [[searchVC alloc] initWithNibName:@"searchVC" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:vc animated:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
