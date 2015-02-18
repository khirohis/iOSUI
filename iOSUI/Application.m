//
//  Application.m
//  iOSUI
//
//  Created by 小林 博久 on 2015/02/18.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import "Application.h"
#import "CoreDataContextManager.h"


@interface Application ()

@property (strong, nonatomic) CoreDataContextManager *coreDataContextManager;

@end


@implementation Application

+ (Application *)sharedApplication {
    static Application *application = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        application = [[Application alloc] init];
    });

    return application;
}


- (void)initialize {
    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:@"iOSUI" withExtension:@"momd"];
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *storeUrl = [NSURL fileURLWithPath:[documents stringByAppendingPathComponent:@"iOSUI.sqlite"]];

    self.coreDataContextManager = [[CoreDataContextManager alloc] initWithModelURL:modelUrl
                                                                          storeURL:storeUrl];
}


- (CoreDataContextManager *)sharedCoreDataContextManager {
    return self.coreDataContextManager;
}

@end
