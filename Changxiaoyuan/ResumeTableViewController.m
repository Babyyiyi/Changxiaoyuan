//
//  ResumeTableViewController.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-1.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import "ResumeTableViewController.h"
#import "BookTableViewCell.h"
#import "MJRefresh/MJRefresh.h"

@interface ResumeTableViewController ()

@property (strong, nonatomic) UIActivityIndicatorView *activity;
@property (strong, nonatomic) NSArray *data;

@end

@implementation ResumeTableViewController

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
    
    _activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(140, 220, 40, 40)];
    [_activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:_activity];
    [_activity startAnimating];
    
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    NSString *urlString = [NSString stringWithFormat:@"http://xiyou.changxiaoyuan.com/api/?callback=&username=%@&do=user&password=%@&appkey=4107762472",username,password];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        _data = [dic objectForKey:@"result"];
        [self.tableView reloadData];
        [_activity stopAnimating];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdetifier = @"bookcell";
//    
//    UINib *nib = [UINib nibWithNibName:@"BookTableViewCell"
//                                bundle:nil];
//    [tableView registerNib:nib forCellReuseIdentifier:CellIdetifier];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdetifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdetifier];
        NSDictionary *rowData = [_data objectAtIndex:indexPath.row];
        cell.textLabel.text = [rowData objectForKey:@"title"];
        cell.detailTextLabel.text = [rowData objectForKey:@"time"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
