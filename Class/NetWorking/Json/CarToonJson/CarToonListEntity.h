//
//  
//  AutomaticCoder
//
//  Created by 张玺自动代码生成器   http://zhangxi.me
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface CarToonListEntity : NSObject<NSCoding>

@property (nonatomic,strong) NSString *zxdescription;
@property (nonatomic,strong) NSString *zxid;
@property (nonatomic,strong) NSString *zxkeyword;
@property (nonatomic,strong) NSString *zxuid;
@property (nonatomic,strong) NSString *zxcid;
@property (nonatomic,strong) NSString *zxtitle;
@property (nonatomic,strong) NSString *zxcreate_time;
@property (nonatomic,strong) NSString *zxsort;
@property (nonatomic,strong) NSString *zxstatus;
@property (nonatomic,strong) NSString *zxupdate_time;
@property (nonatomic,strong) NSMutableArray *zximagelist;



-(id)initWithJson:(NSDictionary *)json;

@end
