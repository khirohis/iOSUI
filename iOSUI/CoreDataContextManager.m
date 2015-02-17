//
//  CoreDataContextManager.m
//  CoreDataTest
//
//  Created by 小林 博久 on 2014/10/22.
//  Copyright (c) 2014年 Hirohisa Kobayasi. All rights reserved.
//

#import "CoreDataContextManager.h"


@interface CoreDataContextManager ()

@property (strong, nonatomic) NSURL *modelUrl;
@property (strong, nonatomic) NSURL *storeUrl;

@property (strong, nonatomic) NSManagedObjectModel *model;
@property (strong, nonatomic) NSPersistentStoreCoordinator *coordinator;

@property (strong, nonatomic) NSManagedObjectContext *writeContext;
@property (strong, nonatomic) NSManagedObjectContext *mainContext;

@end


@implementation CoreDataContextManager


- (id)initWithModelURL:(NSURL *)modelURL
              storeURL:(NSURL *)storeUrl
{
    self = [super init];
    if (self != nil) {
        _modelUrl = modelURL;
        _storeUrl = storeUrl;
    }

    return self;
}

- (BOOL)initialize
{
    if (![NSThread isMainThread]) {
        return NO;
    }

    self.model = [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelUrl];
    self.coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model];
    if (![self.coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                        configuration:nil
                                                  URL:self.storeUrl
                                              options:nil
                                                error:nil]) {
        return NO;
    }

    self.writeContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [self.writeContext setPersistentStoreCoordinator:self.coordinator];

    self.mainContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.mainContext.parentContext = self.writeContext;

    return YES;
}


- (void)saveWriteContext
{
    [self.writeContext performBlockAndWait:^{
        [self.writeContext save:nil];
    }];
}


- (NSManagedObjectContext *)managedObjectContext
{
    if ([NSThread isMainThread]) {
        return self.mainContext;
    }

    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    context.parentContext = self.mainContext;

    return context;
}


- (void)saveContext:(NSManagedObjectContext *)context
      didSavedBlock:(void (^)(BOOL))block

{
    if (context != nil && [context hasChanges]) {
        if (context == self.writeContext) {
            [context performBlock:^{
                if ([context save:nil]) {
                    if (block != nil) {
                        block(YES);
                    }
                } else if (block != nil) {
                    block(NO);
                }
            }];
        } else if (context == self.mainContext) {
            [context performBlock:^{
                if ([context save:nil]) {
                    [self saveContext:self.writeContext
                        didSavedBlock:block];
                } else if (block != nil) {
                    block(NO);
                }
            }];
        } else {
            [context performBlock:^{
                if ([context save:nil]) {
                    [self saveContext:self.mainContext
                        didSavedBlock:block];
                } else if (block != nil) {
                    block(NO);
                }
            }];
        }
    }
}


@end
