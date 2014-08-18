//
//  NoClassTableViewController.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-2.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import "NoClassTableViewController.h"

@interface NoClassTableViewController ()

@end

@implementation NoClassTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.png"]];
    _header = [[HeaderParallax alloc] init];
    [_header stretchHeaderForTableView:self.tableView withView:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_header scrollViewDidScroll:scrollView];
}
- (void)viewDidLayoutSubviews
{
    [_header resizeView];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

@end
