//
//  
//  AutomaticCoder
//
//  Created by 张玺自动代码生成器  http://zhangxi.me
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//
#import "CarToonContentJson.h"

@implementation CarToonContentJson


-(id)initWithJson:(NSDictionary *)json;
{
    self = [super init];
    if(self)
    {
    if(json != nil)
    {
       self.zxstatus  = [json objectForKey:@"status"];
 self.zxinfo  = [json objectForKey:@"info"];
 self.zxlist = [NSMutableArray array];
for(NSDictionary *item in [json objectForKey:@"list"])
{
[self.zxlist addObject:[[CarToonContentEntity alloc] initWithJson:item]];
}
self.zxtime  = [json objectForKey:@"time"];
 
    }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.zxstatus forKey:@"zx_status"];
[aCoder encodeObject:self.zxinfo forKey:@"zx_info"];
[aCoder encodeObject:self.zxlist forKey:@"zx_list"];
[aCoder encodeObject:self.zxtime forKey:@"zx_time"];

}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        self.zxstatus = [aDecoder decodeObjectForKey:@"zx_status"];
 self.zxinfo = [aDecoder decodeObjectForKey:@"zx_info"];
 self.zxlist = [aDecoder decodeObjectForKey:@"zx_list"];
 self.zxtime = [aDecoder decodeObjectForKey:@"zx_time"];
 
    }
    return self;
}



@end
