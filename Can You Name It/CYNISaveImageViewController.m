//
//  CYNISaveImageViewController.m
//  Can You Name It
//
//  Created by hust4 on 5/12/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNISaveImageViewController.h"

@interface CYNISaveImageViewController () <UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *packagePicker;
@property (weak, nonatomic) IBOutlet UITextField *imageField;
@property (strong,nonatomic) NSArray *packages;
@property (strong,nonatomic) NSString* imageName;
@property (strong,nonatomic) NSString* package;
@end

@implementation CYNISaveImageViewController

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
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *filePath = [NSString stringWithFormat:@"%@/Files",basePath];
    self.packages = [filemng contentsOfDirectoryAtPath:filePath error:nil];
    self.packagePicker.delegate = self;
    self.packagePicker.dataSource = self;
    NSLog(@"%@",self.packages[0]);
}

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [self.packages count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [self.packages objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    NSLog(@"%@",self.packages[row]);
    self.package = self.packages[row];
}
- (IBAction)savePressed:(id)sender {
    self.imageName = self.imageField.text;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingFormat:@"/Files/%@/%@.jpg",self.package,self.imageName];
    if([self.data writeToFile:path atomically:YES]){
        NSLog(@"Done");
    }
    NSFileManager* man = [NSFileManager defaultManager];
    NSLog(@"%@",[man contentsOfDirectoryAtPath:path error:nil]);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
