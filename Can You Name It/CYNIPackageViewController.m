//
//  CYNIPackageViewController.m
//  Can You Name It
//
//  Created by hust4 on 4/8/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIPackageViewController.h"
#import "CYNIPlayViewController.h"
#import "CYNIPlayViewController.h"
#import "CYNIImagePlayViewController.h"
@interface CYNIPackageViewController ()
@property NSArray* packages;
@property int currentIndex;
@property NSString *basePath;
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
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
    NSFileManager *filemng;
    filemng =[NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    self.basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *filePath = [NSString stringWithFormat:@"%@/Files",self.basePath];
    self.packages = [filemng contentsOfDirectoryAtPath:filePath error:nil];
    self.currentIndex = 0;
    [self.packageName setText:self.packages[0]];
    NSString *coverPath = [self.basePath stringByAppendingFormat:@"/cover/%@.jpg",self.packages[0]];
    UIImage *cover = [UIImage imageWithContentsOfFile:coverPath];
    [self.coverImage setImage:cover];
}

- (IBAction)backPressed:(id)sender {
    self.currentIndex = (self.currentIndex-1)%self.packages.count;
    [self.packageName setText:self.packages[self.currentIndex]];
    NSString *coverPath = [self.basePath stringByAppendingFormat:@"/cover/%@.jpg",self.packages[self.currentIndex]];
    UIImage *cover = [UIImage imageWithContentsOfFile:coverPath];
    [self.coverImage setImage:cover];
}

- (IBAction)nextPressed:(id)sender {
    self.currentIndex = (self.currentIndex+1)%self.packages.count;
    [self.packageName setText:self.packages[self.currentIndex]];
    NSString *coverPath = [self.basePath stringByAppendingFormat:@"/cover/%@.jpg",self.packages[self.currentIndex]];
    UIImage *cover = [UIImage imageWithContentsOfFile:coverPath];
    [self.coverImage setImage:cover];
}
- (IBAction)imagePlayTapped:(id)sender {
    CYNIPlayViewController *playViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ImagePlay"];
    playViewController.package = self.packageName.text;
    [self presentViewController:playViewController animated:YES completion:nil];
}
- (IBAction)wordPlayTapped:(id)sender {
    CYNIImagePlayViewController *imageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WordPlay"];
    imageViewController.package = self.packageName.text;
    [self presentViewController:imageViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
