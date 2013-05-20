//
//  GPUImageSlider.h
//  TomoAnime_HK
//
//  Created by Matt.Choi on 8/5/13.
//  Copyright (c) 2013 Next Media Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPUImage.h"
#import "GPUImageCameraFilter.h"

@interface GPUImageSliderControl : NSObject
+ (void)updateFilterFromSliderValue:(CGFloat)adjustValue CameraFilter:(GPUImageCameraFilter*)cameraFilter;
@end
