//
//  searchVC.m
//  searchController
//
//  Created by 王涛 on 15/12/28.
//  Copyright © 2015年 王涛. All rights reserved.
//

#import "searchVC.h"
#import "searchResultVC.h"

@interface searchVC ()<UISearchResultsUpdating,UISearchBarDelegate>
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *resultArray;
@property (nonatomic, strong) NSMutableArray *tempsArray;
@end

@implementation searchVC

- (NSMutableArray *)resultArray{
    if (!_resultArray) {
        _resultArray = [NSMutableArray array];
        for (int i = 1; i < 11 ; i ++) {
            NSString *str = [NSString stringWithFormat:@"王涛的测试数据%d",i];
            [self.resultArray addObject:str];
        }
    }
    return _resultArray;
}

- (NSMutableArray *)tempsArray{
    if (!_tempsArray) {
        _tempsArray = [NSMutableArray array];
    }
    return _tempsArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSearchController];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initSearchController{
    searchResultVC *resultTVC = [[searchResultVC alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *resultVC = [[UINavigationController alloc] initWithRootViewController:resultTVC];
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:resultVC];
    self.searchController.searchResultsUpdater = self;
    
    //self.searchController.dimsBackgroundDuringPresentation = NO;
    //self.searchController.hidesNavigationBarDuringPresentation = NO;
    
    
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x,self.searchController.searchBar.frame.origin.y,self.searchController.searchBar.frame.size.width,44);
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    self.searchController.searchBar.delegate = self;
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.resultArray[indexPath.row];
    return cell;
}


#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    UINavigationController *navController = (UINavigationController *)self.searchController.searchResultsController;
    searchResultVC *resultVC = (searchResultVC *)navController.topViewController;
    [self filterContentForSearchText:self.searchController.searchBar.text];
    resultVC.resultsArray = self.tempsArray;
    [resultVC.tableView reloadData];
}

#pragma mark - Private Method
- (void)filterContentForSearchText:(NSString *)searchText{
    NSLog(@"%@",searchText);
    NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
    [self.tempsArray removeAllObjects];
    for (int i = 0; i < self.resultArray.count; i++) {
        NSString *title = self.resultArray[i];
        NSRange storeRange = NSMakeRange(0, title.length);
        NSRange foundRange = [title rangeOfString:searchText options:searchOptions range:storeRange];
        if (foundRange.length) {
            [self.tempsArray addObject:self.resultArray[i]];
        }
    }
}

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
