//
//  SearchTableViewController.h
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-5.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Base.h"
#import "Detail.h"
#import "SearchDetailViewController.h"

@interface SearchTableViewController : UITableViewController <UISearchBarDelegate, SearchDetailViewProtocol>

@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) Base *base;
@property (strong, nonatomic) Detail *detail;
@property (strong, nonatomic) NSArray *resultBookArray;
@property (strong, nonatomic) NSArray *resultBookData;
@property (strong, nonatomic) NSDictionary *dic;
@property (strong, nonatomic) NSString *keyword;

@end


