//
//  CYNIViewController.m
//  Can You Name It
//
//  Created by hust4 on 4/5/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIViewController.h"
#import "CYNISaveImageViewController.h"
@interface CYNIViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@end

@implementation CYNIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"database ios"];
    NSString *folderPath = [documentsDirectory stringByAppendingPathComponent:@"Files"];
    NSLog(@"Source Path: %@\n Documents Path: %@ \n Folder Path: %@", sourcePath, documentsDirectory, folderPath);
    
    NSError *error=nil;
    
    if([[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:folderPath error:&error]){
        NSLog(@"File successfully copied");
    } else {
        NSLog(@"Error description-%@ \n", [error localizedDescription]);
        NSLog(@"Error reason-%@", [error localizedFailureReason]);
    }
    sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"cover"];
    folderPath = [documentsDirectory stringByAppendingPathComponent:@"cover"];
    if([[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:folderPath error:&error]){
        NSLog(@"File successfully copied");
    } else {
        NSLog(@"Error description-%@ \n", [error localizedDescription]);
        NSLog(@"Error reason-%@", [error localizedFailureReason]);
    }
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
    imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera] ;
    imagePicker.editing = NO;
    imagePicker.delegate = delegate;
    [controller presentViewController:imagePicker animated:YES completion:nil];
    return YES;
}

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    //[[picker parentViewController] dismissViewControllerAnimated:YES completion:nil];
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
        //UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
    NSData* data = UIImageJPEGRepresentation(imageToSave,1.0);
    //NSString* path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"database ios/Place/"];
    CYNISaveImageViewController *saveViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SaveImage"];
    saveViewController.data = data;
    [self presentViewController:saveViewController animated:YES completion:nil];
   
    //[picker dismissViewControllerAnimated:YES completion:nil];
}

@end
