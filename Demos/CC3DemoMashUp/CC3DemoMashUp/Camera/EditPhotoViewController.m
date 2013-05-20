//
//  EditPhotoViewController.m
//  TomoAnime_HK
//
//  Created by Matt.Choi on 8/5/13.
//  Copyright (c) 2013 Next Media Interactive. All rights reserved.
//

#import "EditPhotoViewController.h"
#import "GPUImage.h"

@interface EditPhotoViewController ()
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *photoImageView;

@end

@implementation EditPhotoViewController

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
    // Do any additional setup after loading the view from its nib.
    self.photoImageView.image = self.photoImage;
}
- (IBAction)closeDidTap:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setPhotoImageView:nil];
    [super viewDidUnload];
}
@end
