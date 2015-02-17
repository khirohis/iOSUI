//
//  TestOperationViewController.m
//  iOSUI
//
//  Created by 小林 博久 on 2015/02/17.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import "TestOperationViewController.h"


@interface TestOperationViewController ()

@property (nonatomic, strong) IBOutlet UITextView *resultText;

- (IBAction)onExecuteOperation:(id)sender;

@end


@implementation TestOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)onExecuteOperation:(id)sender
{
    if (self.operation != nil) {
        self.operation.delegate = self;
        [[NSOperationQueue mainQueue] addOperation:self.operation];
    }
}


- (void)onComplete:(TestOperation *)operation
            result:(NSString *)result
{
    if (result != nil) {
        self.resultText.text = result;
    }
}

@end
