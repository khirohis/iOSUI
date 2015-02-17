//
//  Constants.h
//  iOSUI
//
//  Created by 小林 博久 on 2015/02/17.
//  Copyright (c) 2015年 khirohis. All rights reserved.
//

#ifndef iOSUI_Constants_h
#define iOSUI_Constants_h

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, Categories) {
    CATEGORY_COREDATA       = 0,

    CATEGORY_MAX
};

extern NSString *cCategoryTitles[];


typedef NS_ENUM(NSInteger, CoreDataRows)
{
    COREDATA_ROW_TEST1      = 0,

    COREDATA_ROW_MAX
};

extern NSString *cCoreDataRowTitles[];


#endif
