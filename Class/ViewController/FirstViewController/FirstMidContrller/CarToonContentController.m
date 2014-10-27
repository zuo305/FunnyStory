//
//  CarToonContentController.m
//  FunnyStory
//
//  Created by 左村 on 14/10/25.
//  Copyright (c) 2014年 左村. All rights reserved.
//

#import "CarToonContentController.h"
#import "CarToonListEntity.h"
#import "ZCNetWoking.h"
#import "CarToonContentJson.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Constant.h"

@interface CarToonContentController ()

@end

@implementation CarToonContentController
{
    id mListData;
    NSMutableArray *mImageViewArray;
    BaseLabel *mContentLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    
    UIScrollView *scrollback=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollback];
    
    CarToonListEntity *entity=(CarToonListEntity*)mListData;
    
    mImageViewArray=[[NSMutableArray alloc] init];
    
    int oy=10;
    int offy=10;
    int high=30;
    for(int i=0;i<[entity.zximagelist count];i++)
    {
        NSString *imagepath=[entity.zximagelist objectAtIndex:i];
        UIImageView *imageview=[[UIImageView alloc] initWithFrame:CGRectMake(10, oy+i*(high+offy), 300, high)];
        imageview.backgroundColor=[UIColor whiteColor];
        [mImageViewArray addObject:imageview];
        [scrollback addSubview:imageview];
        
        NSURL *url = [NSURL URLWithString:[imagepath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [imageview sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            float newhigh=(imageview.bounds.size.width*image.size.height)/image.size.width;
            [imageview setFrame:CGRectMake(imageview.frame.origin.x, imageview.frame.origin.y, imageview.bounds.size.width, newhigh)];
            float starty=imageview.frame.origin.y+newhigh+offy;
            for(int j=i+1;j<[entity.zximagelist count];j++)
            {
                UIImageView *imagev=[mImageViewArray objectAtIndex:j];
                [imagev setFrame:CGRectMake(imagev.frame.origin.x, starty, imagev.bounds.size.width, imagev.bounds.size.height)];
                starty=imagev.frame.origin.y+imageview.bounds.size.height+offy;
            }
            
            if(mContentLabel)
            {
                [mContentLabel setFrame:CGRectMake(mContentLabel.frame.origin.x, starty, mContentLabel.bounds.size.width, mContentLabel.bounds.size.height)];
                
                starty=mContentLabel.frame.origin.y+mContentLabel.frame.size.height+offy;
            }
            
            [scrollback setContentSize:CGSizeMake(scrollback.bounds.size.width, starty)];
            
            
        }];
    }
    
    ZCNetWoking *zcnetworking = [[ZCNetWoking alloc] init];
    NSDictionary *parameters=@{@"id":entity.zxid};
    NSString *url=[NSString stringWithFormat:@"%@%@",BASE_URL,GET_CARTOON_CONTENT];
    
    
    [zcnetworking getRequestToUrl:url params:parameters complete:^(BOOL successed, NSObject *result) {
        CarToonContentJson *contentjson = [[CarToonContentJson alloc] initWithJson:(NSDictionary*)result];
        
        if([contentjson.zxlist count]>0)
        {
            CarToonContentEntity *contententity= [contentjson.zxlist objectAtIndex:0];
            
            mContentLabel=[[BaseLabel alloc] initWithFrame:CGRectMake(10, 0, 300, 0)];
            [mContentLabel setFont:[UIFont systemFontOfSize:15.0f]];
            mContentLabel.numberOfLines=0;
            CGSize size=[contententity.zxcontent boundingRectWithSize:CGSizeMake(mContentLabel.bounds.size.width, MAXFLOAT)
                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                       attributes:@{
                                                                    NSFontAttributeName : mContentLabel.font
                                                                    }
                                                          context:nil].size;
            float endy=offy;
            for(NSObject *object in mImageViewArray)
            {
                UIImageView *imageview=(UIImageView*)object;
                endy=imageview.frame.origin.y+imageview.frame.size.height+offy;
            }
            [mContentLabel setFrame:CGRectMake(mContentLabel.frame.origin.x, endy, mContentLabel.bounds.size.width, size.height)];
            [scrollback addSubview:mContentLabel];
            mContentLabel.text=contententity.zxcontent;
            
            [scrollback setContentSize:CGSizeMake(scrollback.bounds.size.width, mContentLabel.frame.origin.y+mContentLabel.frame.size.height+offy)];
            
        }
    
    }];
}

- (void)setListData:(id)listdata
{
    mListData=listdata;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
