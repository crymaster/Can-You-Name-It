//
//  CYNIViewController.m
//  Can You Name It
//
//  Created by hust4 on 4/5/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIViewController.h"
#import "CYNISaveImageViewController.h"
@interface CYNIViewController () 

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
    CYNISaveImageViewController *saveViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SaveImage"];
    [self presentViewController:saveViewController animated:YES completion:nil];
}
- (IBAction)takePhotoPressed:(id)sender {
    
    CYNISaveImageViewController *saveViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SaveImage"];
    [self presentViewController:saveViewController animated:YES completion:nil];
}



@end
