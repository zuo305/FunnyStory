//
//  
//  AutomaticCoder
//
//  Created by 张玺自动代码生成器  http://zhangxi.me
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//
#import "CarToonContentEntity.h"

@implementation CarToonContentEntity


-(id)initWithJson:(NSDictionary *)json;
{
    self = [super init];
    if(self)
    {
    if(json != nil)
    {
       self.zxcontent  = [json objectForKey:@"content"];
 self.zxid  = [json objectForKey:@"id"];
 
    }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.zxcontent forKey:@"zx_content"];
[aCoder encodeObject:self.zxid forKey:@"zx_id"];

}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        self.zxcontent = [aDecoder decodeObjectForKey:@"zx_content"];
 self.zxid = [aDecoder decodeObjectForKey:@"zx_id"];
 
    }
    return self;
}



@end
