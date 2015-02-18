//
//  BaseEntity.h
//  iOSUI
//
//  Created by 小林博久 on 2015/02/18.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BaseEntity : NSManagedObject

@property (nonatomic, retain) NSString * information;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * type;

- (void)attributeCopyToObject:(NSManagedObject *)object;

@end
