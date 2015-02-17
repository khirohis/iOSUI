//
//  DetailViewController.m
//  iOSUI
//
//  Created by 小林博久 on 2015/02/08.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import "DetailViewController.h"


typedef NS_ENUM(NSInteger, Sections)
{
    COREDATA_SECTION        = 0,
    SECTION_MAX
};

typedef NS_ENUM(NSInteger, CoredataRows)
{
    COREDATA_ROW_TEST1      = 0,
    COREDATA_ROW_MAX
};


@interface DetailViewController ()

@end


@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        [self configureView];
    }
}

- (void)configureView
{
    if (self.detailItem) {
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return SECTION_MAX;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;

    switch (section) {
        case COREDATA_SECTION:
            rows = COREDATA_ROW_MAX;

        default:
            break;
    }

    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"Kuma!";
    
    return cell;
}

@end
