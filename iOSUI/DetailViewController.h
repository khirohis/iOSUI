//
//  DetailViewController.h
//  iOSUI
//
//  Created by 小林博久 on 2015/02/08.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

