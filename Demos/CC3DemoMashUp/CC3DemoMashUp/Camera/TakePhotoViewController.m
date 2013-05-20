//
//  TakePhotoViewController.m
//  TomoAnime_HK
//
//  Created by Matt.Choi on 30/4/13.
//  Copyright (c) 2013 Next Media Interactive. All rights reserved.
//

#import "TakePhotoViewController.h"
#import "EditPhotoViewController.h"
#import "FilterListTableViewController.h"
#import "CC3DemoMashUpAppDelegate.h"

#import "GPUImage.h"
#import "GPUImageCameraFilter.h"

@interface TakePhotoViewController ()<AVCaptureVideoDataOutputSampleBufferDelegate,FilterListTableViewControllerDelegate>
@property (nonatomic,strong) GPUImageVideoCamera *cameraSession;
@property (nonatomic,strong) GPUImageCameraFilter *imageFilter;

@property (nonatomic,assign) BOOL photoDidTake;

@property (nonatomic,copy) void(^frameProcessingCompletionBlock)(GPUImageOutput*, CMTime);

@end

@implementation TakePhotoViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // init camera.
    self.cameraSession = [[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionBack];
    self.cameraSession.outputImageOrientation = UIInterfaceOrientationPortrait;

    if([self.view isKindOfClass:[GPUImageView class]]){
        NSLog(@"GPUImageView!!!");
    }else{
        return;
    }
    // add backview target view to show camera.
    GPUImageView *filterView = (GPUImageView *)self.view;
//    filterView.fillMode = kGPUImageFillModePreserveAspectRatioAndFill;
    
    
    __unsafe_unretained TakePhotoViewController *weakSelf = self;

    self.imageFilter = [[GPUImageCameraFilter alloc] init];
    self.imageFilter.videoCamera = self.cameraSession;
    self.imageFilter.cameraView = filterView;
    self.imageFilter.filterSettingsSlider = self.filterSlider;
    [self.imageFilter setCameraFilter:GPUIMAGE_SKETCH];
    
    self.frameProcessingCompletionBlock = ^(GPUImageOutput *outImage, CMTime time){
        if (weakSelf.photoDidTake) {
            UIImage *image = [outImage imageFromCurrentlyProcessedOutput];
            weakSelf.photoDidTake = NO;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                // present edit photo VC.
                EditPhotoViewController *vc = [[EditPhotoViewController alloc] initWithNibName:@"EditPhotoViewController" bundle:nil];
                vc.photoImage = image;
                [weakSelf presentModalViewController:vc animated:YES];
                
            });
        }
    };
    [self.imageFilter.filter  setFrameProcessingCompletionBlock:self.frameProcessingCompletionBlock];
    
    // Notification.
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self.cameraSession selector:@selector(pauseCameraCapture) name:UIApplicationWillResignActiveNotification object:nil];
    [nc addObserver:self.cameraSession selector:@selector(resumeCameraCapture) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.cameraSession startCameraCapture];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.cameraSession stopCameraCapture];
}
- (IBAction)takePhoteDidTap:(id)sender {
//    self.photoDidTake = YES;
    
    CC3DemoMashUpAppDelegate *appDelegate =(CC3DemoMashUpAppDelegate*)[[UIApplication sharedApplication] delegate];

    CCGLView *v = appDelegate.cocos3dViewController.ccGLView;
    
    
    
    NSLog(@"GPUImageView Buffer %d",((GPUImageView *)self.view).displayFramebuffer);
    NSLog(@"cocos3d Buffer %d",[[v renderer] colorRenderBuffer]);
    
//    [self.cameraSession stopCameraCapture];
//    [appDelegate.cocos3dViewController pauseAnimation];
    
    UIImage *screenShot = [appDelegate snapshot:self.view renderBuffer:((GPUImageView *)self.view).displayFramebuffer];
    __unsafe_unretained TakePhotoViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        // present edit photo VC.
        EditPhotoViewController *vc = [[EditPhotoViewController alloc] initWithNibName:@"EditPhotoViewController" bundle:nil];
        NSLog(@"screenShot image %@",screenShot);

        vc.photoImage = screenShot;
        [appDelegate.cocos3dViewController presentModalViewController:vc animated:YES];
        
    });

}

- (IBAction)silderValueChange:(id)sender {
    [self.imageFilter adjustFilterValue];
}
- (IBAction)filterDidTap:(id)sender {
    FilterListTableViewController *vc = [[FilterListTableViewController alloc] initWithNibName:@"FilterListTableViewController" bundle:nil];
    vc.delegate = self;
    if (self.navigationController) {
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [self presentModalViewController:vc animated:YES];
    }
}

#pragma mark - FilterListTableViewController Delegate Callback
- (void)filterTypeDidSelected:(GPUImageShowcaseFilterType)type
{
    [self.imageFilter setCameraFilter:type];
    [self.imageFilter.filter  setFrameProcessingCompletionBlock:self.frameProcessingCompletionBlock];
    [self.cameraSession startCameraCapture];
}
#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setFilterSlider:nil];
    [self setFilterButton:nil];
    [self setTakePhotoButton:nil];
    [super viewDidUnload];
}
- (void)dealloc {

}
@end
