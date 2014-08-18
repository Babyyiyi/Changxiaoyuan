//
//  SearchDetailViewController.h
//  Changxiaoyuan
//
//  Created by mingMac    on 14-8-7.
//  Copyright (c) 2014年 com.ming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detail.h"

@protocol SearchDetailViewProtocol <NSObject>

- (void)setValue:(Detail*)detail;

@end

@interface SearchDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *detailid;
@property (weak, nonatomic) IBOutlet UILabel *changan;
@property (weak, nonatomic) IBOutlet UILabel *yanta;
@property (weak, nonatomic) IBOutlet UITextView *resume;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) Detail *detail;

@property (strong, nonatomic) id<SearchDetailViewProtocol> delegate;

@end
