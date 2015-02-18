//
//  TestOperation.m
//  iOSUI
//
//  Created by 小林 博久 on 2015/02/17.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import "TestOperation.h"

@interface TestOperation ()

- (void)onComplete;

@end


@implementation TestOperation

- (id)init {
    self = [super init];
    if (self != nil) {
        __weak id weakSelf = self;
        self.completionBlock = ^(void) {
            [weakSelf performSelectorOnMainThread:@selector(onComplete)
                                       withObject:nil
                                    waitUntilDone:NO];
        };
    }

    return self;
}

- (void)setDelegate:(id<TestOperationDelegate>)delegate {
    _delegate = delegate;
}

- (void)onComplete {
    if ([self.delegate conformsToProtocol:@protocol(TestOperationDelegate)]) {
        [self.delegate onComplete:self result:self.result];
    }
}

@end
