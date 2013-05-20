//
//  TakePhotoViewController.h
//  TomoAnime_HK
//
//  Created by Matt.Choi on 30/4/13.
//  Copyright (c) 2013 Next Media Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface TakePhotoViewController : UIViewController
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *filterButton;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *takePhotoButton;
@property (unsafe_unretained, nonatomic) IBOutlet UISlider *filterSlider;

@end
