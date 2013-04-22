//
//  CYNIViewController.m
//  Can You Name It
//
//  Created by hust4 on 4/5/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIViewController.h"
#import "CYNIModeViewController.h"
@interface CYNIViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation CYNIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //CYNIModeViewController *mode = segue.destinationViewController;
    //mode.delegate = self;
}
- (IBAction)credit:(id)sender {
    NSFileManager *filemng;
    filemng =[NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSLog(@"%@",basePath);
    [filemng changeCurrentDirectoryPath:basePath];
    //NSArray* file = [filemng contentsOfDirectoryAtPath:basePath error:nil];
    NSArray* file = [filemng contentsOfDirectoryAtPath:filemng.currentDirectoryPath error:nil];
    for (int i=0; i<file.count; i++) {
        NSLog(@"%@",[file objectAtIndex:i]);
    }
}
- (IBAction)takePhotoPressed:(id)sender {
    [self startCameraControllerFromViewController:self usingDelegate:self];
}

- (BOOL)startCameraControllerFromViewController:(UIViewController*)controller
                                  usingDelegate:(id<UIImagePickerControllerDelegate,UINavigationControllerDelegate>)delegate{
    if((![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) ||
        delegate == nil ||
        controller == nil){
        NSLog(@"No camera");
        return NO;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) @"kUTTypeMovie", nil];
    imagePicker.editing = NO;
    imagePicker.delegate = delegate;
    [controller presentViewController:imagePicker animated:YES completion:nil];
    return YES;
}

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    
    [[picker parentViewController] dismissViewControllerAnimated:YES completion:nil];
}

// For responding to the user accepting a newly-captured picture or movie
- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    
        
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToSave = editedImage;
        } else {
            imageToSave = originalImage;
        }
        
        // Save the new image (original or edited) to the Camera Roll
        UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
}
@end
