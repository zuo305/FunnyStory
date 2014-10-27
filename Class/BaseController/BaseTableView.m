//
//  BaseTableView.m
//  FunnyStory
//
//  Created by 左村 on 14/10/22.
//  Copyright (c) 2014年 左村. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView


- (void)reloadData
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self  setTableFooterView:view];
    [super reloadData];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
