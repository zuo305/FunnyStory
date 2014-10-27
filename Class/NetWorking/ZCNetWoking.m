//
//  BaseNetWoking.m
//  FunnyStory
//
//  Created by 左村 on 14/10/25.
//  Copyright (c) 2014年 左村. All rights reserved.
//

#import "ZCNetWoking.h"
#

@implementation ZCNetWoking
{
    AFHTTPRequestOperationManager *operationManager;
}

- (id)init{
    self = [super init];
    if (self) {
        operationManager = [AFHTTPRequestOperationManager manager];
        operationManager.responseSerializer.acceptableContentTypes = nil;
        
    }
    return self;
}



- (void)getRequestToUrl:(NSString *)url params:(NSDictionary *)params complete:(void (^)(BOOL successed, NSObject *result))complete
{
    NSLog(@"url＝%@",url);
    
    [self requestToUrl:url method:@"GET" useCache:NO params:params complete:complete];
}

- (void)requestToUrl:(NSString *)url method:(NSString *)method useCache:(BOOL)useCache
              params:(NSDictionary *)params complete:(void (^)(BOOL successed, NSObject *result))complete
{
    [operationManager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        complete(YES,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        complete(NO,nil);
    }];
}


@end
