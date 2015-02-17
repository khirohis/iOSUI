//
//  TestOperationViewController.m
//  iOSUI
//
//  Created by 小林 博久 on 2015/02/17.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import "TestOperationViewController.h"


@interface TestOperationViewController ()

@property (strong, nonatomic) NSOperationQueue *operationQueue;

@property (strong, nonatomic) IBOutlet UITextView *resultText;

- (IBAction)onExecuteOperation:(id)sender;
- (IBAction)onClose:(id)sender;

@end


@implementation TestOperationViewController

- (NSOperationQueue *)operationQueue {
    @synchronized (self) {
        if (_operationQueue == nil) {
            _operationQueue = [[NSOperationQueue alloc] init];
        }

        return _operationQueue;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)onExecuteOperation:(id)sender {
    if (self.operation != nil) {
        self.operation.delegate = self;
        [self.operationQueue addOperation:self.operation];
    }
}

- (IBAction)onClose:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)onComplete:(TestOperation *)operation
            result:(NSString *)result {
    if (result != nil) {
        self.resultText.text = result;
    }
}

@end
