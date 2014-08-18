//
//  SettingTableViewController.m
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-4.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import "SettingTableViewController.h"

@interface SettingTableViewController ()

@end

@implementation SettingTableViewController

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
    
    self.swc1.on = NO;
    self.swc2.on = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleSwc:(id)sender
{
    if ([(UISwitch *)sender isOn]) {
        NSLog(@"%@ is on",sender);
    }else{
        NSLog(@"%@ is off",sender);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case Settings:
            return 2;
        case AboutUs:
            return 1;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case Settings:
        {
            if (indexPath.row == 1) {
                static NSString *CellIdentifier = @"SettingsCell1";
                
                UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:CellIdentifier];
                    cell.textLabel.text = @"到期提醒";
                    self.swc1 = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 51, 31)];
                    cell.accessoryView = self.swc1;
                    [self.swc1 addTarget:self
                                  action:@selector(toggleSwc:)
                        forControlEvents:UIControlEventValueChanged];
                    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                }
                return cell;
            }else{
                static NSString *CellIdentifier = @"SettingsCell2";
                
                UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:CellIdentifier];
                    cell.textLabel.text = @"显示图片";
                    self.swc2 = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 51, 31)];
                    cell.accessoryView = self.swc2;
                    [self.swc2 addTarget:self
                                  action:@selector(toggleSwc:)
                        forControlEvents:UIControlEventValueChanged];
                    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                }
                return cell;
            }
        }
        case AboutUs:
        {
            static NSString *CellIdentifier = @"AboutUsCell";
            
            UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:CellIdentifier];
                cell.textLabel.text = @"清除缓存";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            return cell;
        }
        default:
        {
            static NSString *CellIdentifier = @"DefaultCell";
            UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:CellIdentifier];
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
                label.text = @"Test";
                cell.accessoryView = label;
                [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
            }
            return cell;
        }
    }
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @" ";
}
- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case Settings:
        case AboutUs:
            return 30.0;
        default:
            return 200.0;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @" ";
}

@end
