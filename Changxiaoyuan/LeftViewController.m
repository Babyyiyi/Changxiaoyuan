//
//  leftViewController.m
//  
//
//  Created by mingMac    on 14-8-1.
//
//
#import <UIViewController+MMDrawerController.h>

#import "LeftViewController.h"
#import "LoginViewController.h"
#import "UserViewController.h"
#import "UserinfoViewController.h"
#import "ModifyViewController.h"
#import "SearchTableViewController.h"
#import "ResumeTableViewController.h"
#import "SyllabusTableViewController.h"
#import "NoClassTableViewController.h"
#import "SettingTableViewController.h"


@interface LeftViewController ()
{
    NSInteger loginState;
}

@end

@implementation LeftViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 280, [UIScreen mainScreen].applicationFrame.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case Profile:
            return 2;
        case Function:
            return 4;
        case Setting:
            return 1;
        default:
            return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LeftCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    }
    
    switch (indexPath.section) {
        case Profile:
            if (indexPath.row == 0) {
                [cell.textLabel setText:@"个人资料"];
            }else{
                [cell.textLabel setText:@"修改密码"];
            }
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            break;
        case Function:
            if (indexPath.row == 0) {
                [cell.textLabel setText:@"图书查询"];
            }else if (indexPath.row == 1){
                [cell.textLabel setText:@"图书续借"];
            }else if (indexPath.row == 2){
                [cell.textLabel setText:@"课程表"];
            }else{
                [cell.textLabel setText:@"无课教室"];
            }
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            break;
        case Setting:
            [cell.textLabel setText:@"个性化"];
        default:
            break;
    }
    
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case Profile:
            return @"用户信息";
        case Function:
            return @"校园生活";
        case Setting:
            return @"设置";
        default:
            return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 56.0;
}

#pragma mark Table Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL state = [[NSUserDefaults standardUserDefaults] boolForKey:@"loginState"];
    switch (indexPath.section) {
        case Profile:{
            if (indexPath.row == 0) {
                if (state) {
                    UserinfoViewController *userInfoViewController = [[UserinfoViewController alloc] init];
                    [self.mm_drawerController setCenterViewController:userInfoViewController
                                                   withCloseAnimation:YES
                                                           completion:nil];
                }else{
                    LoginViewController *loginViewController = [[LoginViewController alloc] init];
                    [self.mm_drawerController setCenterViewController:loginViewController
                                                   withCloseAnimation:YES
                                                           completion:nil];
                }
            }else{
                ModifyViewController *modifyViewController = [[ModifyViewController alloc] init];
                [self.mm_drawerController setCenterViewController:modifyViewController
                                               withCloseAnimation:YES
                                                       completion:nil];
            }
            break;
        }
        case Function:{
            if (indexPath.row == 0) {
                SearchTableViewController *searchTableViewController = [[SearchTableViewController alloc] init];
                [self.mm_drawerController setCenterViewController:searchTableViewController
                                               withCloseAnimation:YES
                                                       completion:nil];
            }else if (indexPath.row == 1){
                if ([[NSUserDefaults standardUserDefaults] boolForKey:@"loginState"]) {
                    ResumeTableViewController *resumeTableViewController = [[ResumeTableViewController alloc] init];
                    [self.mm_drawerController setCenterViewController:resumeTableViewController
                                                   withCloseAnimation:YES
                                                           completion:nil];
                }else{
                    LoginViewController *loginViewController = [[LoginViewController alloc] init];
                    [self.mm_drawerController setCenterViewController:loginViewController
                                                   withCloseAnimation:YES
                                                           completion:nil];
                }
            }else if (indexPath.row == 2){
                SyllabusTableViewController *syllabusTableViewController = [[SyllabusTableViewController alloc] init];
                [self.mm_drawerController setCenterViewController:syllabusTableViewController
                                               withCloseAnimation:YES
                                                       completion:nil];
            }else{
                NoClassTableViewController *noClassTableViewController = [[NoClassTableViewController alloc] init];
                [self.mm_drawerController setCenterViewController:noClassTableViewController
                                               withCloseAnimation:YES
                                                       completion:nil];
            }
            break;
        }
        case Setting:{
            SettingTableViewController *settingTableViewController = [[SettingTableViewController alloc] init];
            [self.mm_drawerController setCenterViewController:settingTableViewController
                                           withCloseAnimation:YES
                                                   completion:nil];
        }
        default:
            break;
    }
}

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
