//
//  ViewController.m
//  FunnyStory
//
//  Created by 左村 on 14/10/22.
//  Copyright (c) 2014年 左村. All rights reserved.
//

#import "FirstViewController.h"
#import "CarToonTableViewCell.h"
#import "ZCNetWoking.h"
#import "CarToonListJson.h"
#import "CarToonContentController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
{
    IBOutlet BaseTableView *mTableView;
    NSMutableArray *mDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [mTableView registerNib:[UINib nibWithNibName:@"CarToonTableViewCell" bundle:nil] forCellReuseIdentifier:@"CarToonTableViewCell"];
    [self getDataByUrl];
}

- (void)getDataByUrl
{
    ZCNetWoking *zcnetworking=[[ZCNetWoking alloc] init];
    NSString *url=[NSString stringWithFormat:@"%@%@",BASE_URL,GET_CARTOON_URL];
    NSDictionary *params=@{@"cid":@"10"};
    [zcnetworking getRequestToUrl:url params:params complete:^(BOOL successed, NSObject *result) {
        if(successed==YES)
        {
            CarToonListJson *datajson=[[CarToonListJson alloc] initWithJson:(NSDictionary*)result];
            if(datajson)
            {
                mDataArray=datajson.zxlist;
                [mTableView reloadData];
            }
        }
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//设置rowHeight
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 75;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row< [mDataArray count])
    {
        CarToonListEntity *entity=(CarToonListEntity*)[mDataArray objectAtIndex:indexPath.row];
        
        
        CarToonContentController *conntentcontroller=[[CarToonContentController alloc] init];
        [conntentcontroller setListData:entity];
        [self.navigationController pushViewController:conntentcontroller animated:YES];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(mDataArray)
        return [mDataArray count];
    return 0;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     CarToonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarToonTableViewCell" forIndexPath:indexPath];
 
     if(indexPath.row<[mDataArray count])
     {
         CarToonListEntity *entity=(CarToonListEntity*)[mDataArray objectAtIndex:indexPath.row];
         cell.mTitleLabel.text=entity.zxtitle;
     }
     
 // Configure the cell...
 
 return cell;
 }












@end
