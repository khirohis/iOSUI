//
//  TableInterfaceController.m
//  iOSUI
//
//  Created by 小林 博久 on 2015/03/31.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import "TableInterfaceController.h"
#import "TableRowController.h"


@interface TableInterfaceController ()

@property (strong, nonatomic) NSMutableArray *rows;

@end


@implementation TableInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    [super willActivate];

    self.rows = [NSMutableArray array];
    [self.rows addObject:@"row-1"];
    [self.rows addObject:@"row-2"];
    [self.rows addObject:@"row-3"];
    [self.rows addObject:@"row-4"];
    [self.rows addObject:@"row-5"];
    [self.rows addObject:@"row-6"];

    NSUInteger rowCount = self.rows.count;
    [self.table setNumberOfRows:rowCount
                    withRowType:@"tableRowController"];

    for (NSUInteger i = 0; i < rowCount; i++){
        NSString *labelText = [self.rows objectAtIndex:i];
        TableRowController *tableRowController = [self.table rowControllerAtIndex:i];
        [tableRowController setLabelText:labelText];
    }
}

- (void)didDeactivate {
    [super didDeactivate];
}

@end
