//
//  TestOperation.h
//  iOSUI
//
//  Created by 小林 博久 on 2015/02/17.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import <Foundation/Foundation.h>


@class TestOperation;

@protocol TestOperationDelegate <NSObject>

- (void)onComplete:(TestOperation *)operation result:(NSString *)result;

@end


@interface TestOperation : NSOperation

@property (nonatomic, weak) id<TestOperationDelegate> delegate;
@property (nonatomic, strong) NSString *result;

@end
