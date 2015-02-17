//
//  CoreDataContextManager.h
//  CoreDataTest
//
//  Created by 小林 博久 on 2014/10/22.
//  Copyright (c) 2014年 Hirohisa Kobayasi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Coredata/CoreData.h>


@interface CoreDataContextManager : NSObject

- (id)initWithModelURL:(NSURL *)modelURL
              storeURL:(NSURL *)storeUrl;

- (BOOL)initialize;

- (void)saveWriteContext;

- (NSManagedObjectContext *)managedObjectContext;
- (void)saveContext:(NSManagedObjectContext *)managedObjectContext
      didSavedBlock:(void (^)(BOOL))block;

@end
