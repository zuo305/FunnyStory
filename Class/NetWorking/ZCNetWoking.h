//
//  BaseNetWoking.h
//  FunnyStory
//
//  Created by 左村 on 14/10/25.
//  Copyright (c) 2014年 左村. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


@interface ZCNetWoking : NSObject


//GET 请求
- (void)getRequestToUrl:(NSString *)url params:(NSDictionary *)params complete:(void (^)(BOOL successed, NSObject *result))complete;


@end
