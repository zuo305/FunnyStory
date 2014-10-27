//
//  Constant.h
//  FunnyStory
//
//  Created by 左村 on 14/10/25.
//  Copyright (c) 2014年 左村. All rights reserved.
//

#ifndef FunnyStory_Constant_h
#define FunnyStory_Constant_h


#define APP_TEST 0

#if APP_TEST
#define BASE_URL         @"http://localhost/api/"
#else
#define BASE_URL         @"http://www.o2ogps.com/api/"
#endif

#define GET_CARTOON_URL  @"cartoon/getlist.json"
#define GET_CARTOON_CONTENT  @"cartoon/getcontent.json"


#import "BaseViewController.h"
#import "BaseView.h"
#import "BaseTableView.h"
#import "BaseTableViewCell.h"
#import "BaseLabel.h"

#endif
