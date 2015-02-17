//
//  TestOperationViewController.h
//  iOSUI
//
//  Created by 小林 博久 on 2015/02/17.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestOperation.h"


@interface TestOperationViewController : UIViewController <TestOperationDelegate>

@property (nonatomic, strong) TestOperation *operation;

@end
