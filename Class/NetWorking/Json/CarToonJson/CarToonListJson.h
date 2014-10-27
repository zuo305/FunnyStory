//
//  
//  AutomaticCoder
//
//  Created by 张玺自动代码生成器   http://zhangxi.me
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "CarToonListEntity.h"

@interface CarToonListJson : NSObject<NSCoding>

@property (nonatomic,strong) NSNumber *zxstatus;
@property (nonatomic,strong) NSString *zxinfo;
@property (nonatomic,strong) NSMutableArray *zxlist;
@property (nonatomic,strong) NSNumber *zxtime;
 


-(id)initWithJson:(NSDictionary *)json;

@end
