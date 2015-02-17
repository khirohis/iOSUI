//
//  MasterViewController.h
//  iOSUI
//
//  Created by 小林博久 on 2015/02/08.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
