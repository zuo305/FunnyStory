//
//  CarToonTableViewCell.h
//  FunnyStory
//
//  Created by 左村 on 14/10/25.
//  Copyright (c) 2014年 左村. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface CarToonTableViewCell : BaseTableViewCell

@property (nonatomic) IBOutlet BaseLabel *mTitleLabel;
@property (nonatomic) IBOutlet BaseLabel *mAuthorLabel;
@property (nonatomic) IBOutlet BaseLabel *mTimeLabel;

@end
