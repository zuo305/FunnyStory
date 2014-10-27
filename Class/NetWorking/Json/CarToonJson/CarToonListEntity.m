//
//  
//  AutomaticCoder
//
//  Created by 张玺自动代码生成器  http://zhangxi.me
//  Copyright (c) 2012年 me.zhangxi. All rights reserved.
//
#import "CarToonListEntity.h"

@implementation CarToonListEntity


-(id)initWithJson:(NSDictionary *)json;
{
    self = [super init];
    if(self)
    {
    if(json != nil)
    {
       self.zxdescription  = [json objectForKey:@"description"];
 self.zxid  = [json objectForKey:@"id"];
 self.zxkeyword  = [json objectForKey:@"keyword"];
 self.zxuid  = [json objectForKey:@"uid"];
 self.zxcid  = [json objectForKey:@"cid"];
 self.zxtitle  = [json objectForKey:@"title"];
 self.zxcreate_time  = [json objectForKey:@"create_time"];
 self.zxsort  = [json objectForKey:@"sort"];
 self.zxstatus  = [json objectForKey:@"status"];
 self.zxupdate_time  = [json objectForKey:@"update_time"];
 
        self.zximagelist=[[NSMutableArray alloc] init];
        for(NSObject *item in [json objectForKey:@"images"])
        {
            [self.zximagelist addObject:[[NSString alloc] initWithString:(NSString*)item]];
        }
        
    }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.zxdescription forKey:@"zx_description"];
[aCoder encodeObject:self.zxid forKey:@"zx_id"];
[aCoder encodeObject:self.zxkeyword forKey:@"zx_keyword"];
[aCoder encodeObject:self.zxuid forKey:@"zx_uid"];
[aCoder encodeObject:self.zxcid forKey:@"zx_cid"];
[aCoder encodeObject:self.zxtitle forKey:@"zx_title"];
[aCoder encodeObject:self.zxcreate_time forKey:@"zx_create_time"];
[aCoder encodeObject:self.zxsort forKey:@"zx_sort"];
[aCoder encodeObject:self.zxstatus forKey:@"zx_status"];
[aCoder encodeObject:self.zxupdate_time forKey:@"zx_update_time"];

}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self)
    {
        self.zxdescription = [aDecoder decodeObjectForKey:@"zx_description"];
 self.zxid = [aDecoder decodeObjectForKey:@"zx_id"];
 self.zxkeyword = [aDecoder decodeObjectForKey:@"zx_keyword"];
 self.zxuid = [aDecoder decodeObjectForKey:@"zx_uid"];
 self.zxcid = [aDecoder decodeObjectForKey:@"zx_cid"];
 self.zxtitle = [aDecoder decodeObjectForKey:@"zx_title"];
 self.zxcreate_time = [aDecoder decodeObjectForKey:@"zx_create_time"];
 self.zxsort = [aDecoder decodeObjectForKey:@"zx_sort"];
 self.zxstatus = [aDecoder decodeObjectForKey:@"zx_status"];
 self.zxupdate_time = [aDecoder decodeObjectForKey:@"zx_update_time"];
 
    }
    return self;
}



@end
