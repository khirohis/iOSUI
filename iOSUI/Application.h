//
//  Application.h
//  iOSUI
//
//  Created by 小林 博久 on 2015/02/18.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CoreDataContextManager;

@interface Application : NSObject

+ (Application *)sharedApplication;

- (void)initialize;

- (CoreDataContextManager *)sharedCoreDataContextManager;

@end
