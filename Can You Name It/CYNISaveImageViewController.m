//
//  CYNISaveImageViewController.m
//  Can You Name It
//
//  Created by hust4 on 5/12/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNISaveImageViewController.h"

@interface CYNISaveImageViewController () <UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>
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
    self.imageField.delegate = self;
    self.imageName = @"default";
    NSFileManager *filemng;
    filemng =[NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *filePath = [NSString stringWithFormat:@"%@/Files",basePath];
    self.packages = [filemng contentsOfDirectoryAtPath:filePath error:nil];
    self.package = self.packages[0];
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
    self.package = self.packages[row];
}
- (IBAction)savePressed:(id)sender {
    if (self.data==NULL) {
        NSLog(@"Empty");
        return;
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingFormat:@"/Files/%@/%@.jpg",self.package,self.imageName];
    NSLog(@"%@",path);
    if([self.data writeToFile:path atomically:YES]){
        NSLog(@"Done");
    }
    NSFileManager* man = [NSFileManager defaultManager];
    NSLog(@"%@",[man contentsOfDirectoryAtPath:path error:nil]);
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)photoTaken:(id)sender {
    [self startCameraControllerFromViewController:self usingDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    self.data = UIImageJPEGRepresentation(imageToSave,1.0);
    //NSString* path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"database ios/Place/"];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    self.imageName = textField.text;
    NSLog(@"%@",self.imageName);
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
