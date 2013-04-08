//
//  CYNIPackageViewController.m
//  Can You Name It
//
//  Created by hust4 on 4/8/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIPackageViewController.h"
#import "CYNIPlayViewController.h"
@interface CYNIPackageViewController ()

@end

@implementation CYNIPackageViewController

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
	// Do any additional setup after loading the view.
}
- (IBAction)placePressed:(UIButton *)sender {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton*)sender{
    CYNIPlayViewController* play = segue.destinationViewController;
    play.package = sender.currentTitle;
}
@end
