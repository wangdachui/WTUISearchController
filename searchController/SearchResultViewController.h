//
//  SearchResultViewController.h
//  searchController
//
//  Created by 王涛 on 16/3/7.
//  Copyright © 2016年 王涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
// 搜索结果数据
@property (nonatomic, strong) NSMutableArray *resultsArray;
@end
