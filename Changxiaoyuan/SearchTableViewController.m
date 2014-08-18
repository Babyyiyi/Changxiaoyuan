//
//  SearchTableViewController.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-5.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//
#import <UIViewController+MMDrawerController.h>
#import "SearchTableViewController.h"
#import "MJRefresh.h"
#import "SearchDetailViewController.h"

@interface SearchTableViewController ()

@property (strong, nonatomic) UIActivityIndicatorView *activity;

@property (strong, nonatomic) SearchDetailViewController *searchDetailViewController;

@end

static NSInteger refreshcount = 1;

@implementation SearchTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    _searchBar.placeholder = @"请输入要搜索的书名";
    _searchBar.delegate = self;
    [self.view addSubview:_searchBar];
    
    [_searchBar becomeFirstResponder];
}


#pragma mark - TableView data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *rowData = [_array objectAtIndex:indexPath.row];
    _base = [[Base alloc] init];
    _base.title = [rowData objectForKey:@"title"];
    _base.author = [rowData objectForKey:@"author"];
    _base.isbn = [rowData objectForKey:@"isbn"];
    _base.detail = [rowData objectForKey:@"detail"];
    _base.press = [rowData objectForKey:@"press"];
    
    static NSString *CellIdentifier = @"searchBook";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                       reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = _base.title;
    cell.detailTextLabel.text = _base.author;
    return cell;
}

#pragma mark - TableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(140, 220, 40, 40)];
    [_activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:_activity];
    [_activity startAnimating];
    
    _searchDetailViewController = [[SearchDetailViewController alloc] init];
    
    NSDictionary *rowData = [_array objectAtIndex:indexPath.row];
    NSString *isbn = [rowData objectForKey:@"isbn"];
    NSString *detail = [rowData objectForKey:@"detail"];
    NSString *urlString = [NSString stringWithFormat:@"http://xiyou.changxiaoyuan.com/api/?callback=&ctrlid=%@&do=querydetail&isbn=%@&appkey=4107762472",detail,isbn];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    NSLog(@"submit");
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        _detail = [[Detail alloc] init];
        _detail.detailid = [dic objectForKey:@"detailid"];
        _detail.changan = [dic objectForKey:@"changan"];
        _detail.yanta = [dic objectForKey:@"yanta"];
        _detail.dblink = [dic objectForKey:@"dblink"];
        _detail.resume = [dic objectForKey:@"summary"];
        _detail.imageArray = [dic objectForKey:@"image"];
        
        _searchDetailViewController.delegate = self;
        _searchDetailViewController.detail = self.detail;
        
        [self.mm_drawerController setCenterViewController:_searchDetailViewController
                                       withCloseAnimation:YES completion:nil];
        [_activity stopAnimating];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

#pragma mark - Search delegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    _activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(140, 220, 40, 40)];
    [_activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:_activity];
    [_activity startAnimating];
    
    _keyword = searchBar.text;
    _keyword = [_keyword stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    _detail.keyword = _keyword;
    
    NSString *urlString = [NSString stringWithFormat:@"http://xiyou.changxiaoyuan.com/api/?callback=&w=%@&do=querybook&appkey=4107762472",_keyword];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        _array = [dic objectForKey:@"result"];
        [self.tableView reloadData];
        [_activity stopAnimating];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
}


#pragma mark - FooterRefresh

- (void)footerRereshing
{
    refreshcount++;
    NSString *urlString = [NSString stringWithFormat:@"http://xiyou.changxiaoyuan.com/api/?callback=&w=%@&do=querybook&page=%ld&appkey=4107762472",_keyword,(long)refreshcount];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        _dic = (NSDictionary *)responseObject;
        _data = [_dic objectForKey:@"result"];
        _array = [_array arrayByAddingObjectsFromArray:_data];
        
        [self.tableView reloadData];
        [self.tableView footerEndRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

#pragma mark - SearchDetailView delegate
- (void)setValue:(Detail*)detail
{
    detail.changan = self.detail.changan;
    detail.yanta = self.detail.yanta;
    detail.dblink = self.detail.dblink;
    detail.resume = self.detail.resume;
    detail.imageArray = self.detail.imageArray;
}

@end
