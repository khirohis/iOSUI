//
//  ItemEntity.h
//  iOSUI
//
//  Created by 小林博久 on 2015/02/18.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseEntity.h"

@class ListEntity;

@interface ItemEntity : BaseEntity

@property (nonatomic, retain) NSNumber * itemType;
@property (nonatomic, retain) ListEntity *list;

@end
