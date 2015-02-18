//
//  ListEntity.h
//  iOSUI
//
//  Created by 小林博久 on 2015/02/18.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseEntity.h"

@class ItemEntity;

@interface ListEntity : BaseEntity

@property (nonatomic, retain) NSNumber * listType;
@property (nonatomic, retain) NSSet *items;
@end

@interface ListEntity (CoreDataGeneratedAccessors)

- (void)addItemsObject:(ItemEntity *)value;
- (void)removeItemsObject:(ItemEntity *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
