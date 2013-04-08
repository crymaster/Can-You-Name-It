//
//  CYNIViewController.m
//  Can You Name It
//
//  Created by hust4 on 4/5/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIViewController.h"
#import "CYNIModeViewController.h"
@interface CYNIViewController ()<CYNIModeViewControllerDelegate>

@end

@implementation CYNIViewController

- (void)userDismissModeViewController:(CYNIModeViewController *)vc{
    [self dismissViewControllerAnimated:YES completion:nil];
}
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
    CYNIModeViewController *mode = segue.destinationViewController;
    mode.delegate = self;
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
@end
