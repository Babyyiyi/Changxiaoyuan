//
//  leftViewController.h
//  
//
//  Created by mingMac    on 14-8-1.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DrawerSection)
{
    Profile,
    Function,
    Setting,
};

@interface LeftViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end
