//
//  BaseEntity.m
//  iOSUI
//
//  Created by 小林博久 on 2015/02/18.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import "BaseEntity.h"


@implementation BaseEntity

@dynamic information;
@dynamic title;
@dynamic type;

- (void)attributeCopyToObject:(NSManagedObject *)object {
    NSDictionary *attributes = [self.entity attributesByName];
    NSArray *keys = attributes.allKeys;
    for (NSString *key in keys) {
        id value = [self valueForKey:key];
//        [object setValue:[value copy] forKey:key];
        [object setValue:value forKey:key];
    }
}

@end
