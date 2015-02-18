//
//  CoreDataTest1Operation.m
//  iOSUI
//
//  Created by 小林 博久 on 2015/02/17.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import "CoreDataTest1Operation.h"
#import "Application.h"
#import "CoreDataContextManager.h"


@implementation CoreDataTest1Operation

- (void)main {
    CoreDataContextManager *manager = [[Application sharedApplication] sharedCoreDataContextManager];
    NSManagedObjectContext *context = [manager managedObjectContext];

    self.result = @"KUMA!";
}

@end
