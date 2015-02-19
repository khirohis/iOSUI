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
#import "ItemEntity.h"


@implementation CoreDataTest1Operation

- (void)main {
    CoreDataContextManager *manager = [[Application sharedApplication] sharedCoreDataContextManager];
    NSManagedObjectContext *context = [manager managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ItemEntity"
                                              inManagedObjectContext:context];

    // clear items
    NSFetchRequest *request = [[[context persistentStoreCoordinator] managedObjectModel]
                               fetchRequestTemplateForName:@"AllItemEntity"];
    NSError *error = nil;
    NSArray *items = [context executeFetchRequest:request
                                            error:&error];
    if (items != nil) {
        for (ItemEntity *item in items) {
            [context deleteObject:item];
        }
    }

    [manager saveAndWaitContext:context];

    // create item1
    ItemEntity *item1 = [[ItemEntity alloc] initWithEntity:entity
                            insertIntoManagedObjectContext:context];

    item1.type = [NSNumber numberWithShort:1];
    item1.title = @"KUMA1";
    item1.information = @"KUMA KUMA TACORA";

    item1.itemType = [NSNumber numberWithShort:1];

    [manager saveAndWaitContext:context];

    // create copy
    ItemEntity *item2 = [[ItemEntity alloc] initWithEntity:entity
                            insertIntoManagedObjectContext:context];
    [item1 attributeCopyToObject:item2];

    // delete item1
    [context deleteObject:item1];

    [manager saveAndWaitContext:context];

    // build result string
    NSMutableString *result = [[NSMutableString alloc] init];

    items = [context executeFetchRequest:request
                                   error:&error];
    if (items != nil) {
        for (ItemEntity *item in items) {
            [result appendFormat:@"item ID: %@\n", item.objectID];
        }
    }

    self.result = [result copy];
}

@end
