//
//  DetailViewController.m
//  iOSUI
//
//  Created by 小林博久 on 2015/02/08.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import "Constants.h"
#import "DetailViewController.h"
#import "TestOperationViewController.h"
#import "CoreDataTest1Operation.h"


@interface DetailViewController ()

- (void)didSelectCoreDataRow:(NSInteger)row;

- (void)presentTestOperationViewWithOperation:(TestOperation *)operation;

@end


@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setCategory:(NSNumber *)category
{
    if (_category != category) {
        _category = category;

        [self configureView];
    }
}

- (void)configureView
{
    if (self.category) {
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger row = 0;

    NSInteger category = [self.category integerValue];
    switch (category) {

        case CATEGORY_COREDATA:
            row = COREDATA_ROW_MAX;

        default:
            break;
    }

    return row;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *title = @"";

    NSInteger category = [self.category integerValue];
    switch (category) {

        case CATEGORY_COREDATA:
            title = cCoreDataRowTitles[indexPath.row];
            break;

        default:
            break;
    }

    cell.textLabel.text = title;

    return cell;
}

- (void)tableView:(UITableView *)tableView
 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger category = [self.category integerValue];
    switch (category) {
            
        case CATEGORY_COREDATA:
            [self didSelectCoreDataRow:indexPath.row];
            break;
            
        default:
            break;
    }
}

- (void)didSelectCoreDataRow:(NSInteger)row
{
    switch (row) {

        case COREDATA_ROW_TEST1:
            [self presentTestOperationViewWithOperation:[[CoreDataTest1Operation alloc] init]];
            break;

        default:
            break;
    }
}

- (void)presentTestOperationViewWithOperation:(TestOperation *)operation
{
    TestOperationViewController *vc = [[TestOperationViewController alloc] initWithNibName:@"TestOperationViewController" bundle:nil];
    vc.operation = operation;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
