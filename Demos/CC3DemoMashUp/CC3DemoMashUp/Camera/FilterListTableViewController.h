//
//  FilterListTableViewController.h
//  TomoAnime_HK
//
//  Created by Matt.Choi on 8/5/13.
//  Copyright (c) 2013 Next Media Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImageCameraFilter.h"

@protocol FilterListTableViewControllerDelegate <NSObject>
- (void)filterTypeDidSelected:(GPUImageShowcaseFilterType)type;
@end
@interface FilterListTableViewController : UITableViewController
@property (nonatomic,assign) id<FilterListTableViewControllerDelegate> delegate;
@end
