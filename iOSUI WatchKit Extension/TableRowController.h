//
//  TableRowController.h
//  iOSUI
//
//  Created by 小林 博久 on 2015/03/31.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>


@interface TableRowController : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *label;

- (void)setLabelText:(NSString *)text;

@end
