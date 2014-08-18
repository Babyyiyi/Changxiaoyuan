//
//  SettingTableViewController.h
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-4.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SettingsSection)
{
    Settings,
    AboutUs,
};

@interface SettingTableViewController : UITableViewController

@property (strong, nonatomic) UISwitch *swc1;
@property (strong, nonatomic) UISwitch *swc2;


@end
