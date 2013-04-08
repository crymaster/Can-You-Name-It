//
//  CYNIPlayViewController.m
//  Can You Name It
//
//  Created by hust4 on 4/6/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIPlayViewController.h"
#import "CYNIData.h"
@interface CYNIPlayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *word;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong,nonatomic) CYNIData *data;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (nonatomic) int rightChoice;
@property (nonatomic) int level;
@end

@implementation CYNIPlayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CYNIData*)data{
    if (!_data) {
        _data = [[CYNIData alloc] initWithPackage:self.package];
    }
    return _data;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    srand(time(NULL));
    self.level = 1;
    [self setupDisplay];
    }
- (IBAction)image1Tapped:(id)sender {
    if (self.rightChoice==0) {
        self.level++;
        [self setupDisplay];
    }
    else{
       // [self setupDisplay];
    }
    //NSLog(@"Inside");
}
- (IBAction)image2Tapped:(id)sender {
    if (self.rightChoice==1) {
        self.level++;
        [self setupDisplay];
    }
    else{
       // [self setupDisplay];
    }
}
- (IBAction)image3Tapped:(id)sender {
    if (self.rightChoice==2) {
        self.level++;
        [self setupDisplay];
    }
    else{
        // [self setupDisplay];
    }
}
- (IBAction)image4Tapped:(id)sender {
    if (self.rightChoice==3) {
        self.level++;
        [self setupDisplay];
    }
    else{
        // [self setupDisplay];
    }
}

- (void)setupDisplay{
    self.rightChoice = rand()%4;
    self.levelLabel.text = [NSString stringWithFormat:@"Level %d",self.level];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",(self.level-1)*100];
    NSString* image1Name = [self.data takeRandomImage];
    [self.image1 setImage:[UIImage imageWithContentsOfFile:image1Name]];
    
    NSString* image2Name;
    do {
        image2Name = [self.data takeRandomImage];
    } while ([image2Name isEqualToString:image1Name]);
    [self.image2 setImage:[UIImage imageWithContentsOfFile:image2Name]];
    
    NSString* image3Name;
    do {
        image3Name = [self.data takeRandomImage];
    } while ([image3Name isEqualToString:image1Name] ||
             [image3Name isEqualToString:image2Name]);
    [self.image3 setImage:[UIImage imageWithContentsOfFile:image3Name]];
    
    NSString* image4Name;
    do {
        image4Name = [self.data takeRandomImage];
    } while ([image4Name isEqualToString:image1Name] ||
             [image4Name isEqualToString:image2Name] ||
             [image4Name isEqualToString:image3Name]
        );
    [self.image4 setImage:[UIImage imageWithContentsOfFile:image4Name]];
    NSString *wordInImage;
    switch (self.rightChoice) {
        case 0:
            wordInImage = image1Name;
            break;
        case 1:
            wordInImage = image2Name;
            break;
        case 2:
            wordInImage = image3Name;
            break;
        case 3:
            wordInImage = image4Name;
            break;
        default:
            break;
    }
    NSArray* components = [wordInImage componentsSeparatedByString:@".jpg"];
    self.word.text = [components objectAtIndex:0];
    NSLog(@"%d",self.rightChoice);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
