//
//  CYNIHTPViewController.m
//  Can You Name It
//
//  Created by hust4 on 5/12/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIHTPViewController.h"

@interface CYNIHTPViewController ()

@end

@implementation CYNIHTPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)backPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
