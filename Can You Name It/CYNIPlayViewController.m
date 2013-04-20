//
//  CYNIPlayViewController.m
//  Can You Name It
//
//  Created by hust4 on 4/6/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIPlayViewController.h"
#import "CYNIData.h"
#import "CYNI_highScoreMemory.h"
#import "CYNIResultViewController.h"
@interface CYNIPlayViewController () <CYNIResultdelegate>
@property (weak, nonatomic) IBOutlet UILabel *word;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *liveLeftLabel;

@property (strong,nonatomic) CYNIData *data;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (nonatomic) int rightChoice;
@property (nonatomic) int numberOfRightChoice;
@property (nonatomic) int score;
@property (nonatomic) int level;
@property (nonatomic) int lifeLeft;
@property (nonatomic,strong) CYNI_highScoreMemory *mem;
@end

@implementation CYNIPlayViewController
@synthesize mem = _mem;
// <--- initialize of high score memory -->
- (CYNI_highScoreMemory *) mem
{
    if (!_mem) {
        _mem = [[CYNI_highScoreMemory alloc] init];
    }
    return _mem;
}

// <-- initialize of data source -->
- (CYNIData*)data{
    if (!_data) {
        _data = [[CYNIData alloc] initWithPackage:self.package];
    }
    return _data;
}

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
    srand(time(NULL));
    self.level = 1;
    self.numberOfRightChoice = 0;
    self.score = 0;
    self.lifeLeft = 5;
    [self setupDisplay];
    }
- (IBAction)stopPressed:(id)sender {
    [self stopPlaying];
}
     
- (IBAction)image1Tapped:(id)sender {
    if (self.rightChoice==0) {
        self.level++;
        self.numberOfRightChoice++;
        self.score = self.score + 100;
        [self setupDisplay];
    }
    else{
        self.level++;
        self.lifeLeft --;
       [self setupDisplay];
        
    }
    //NSLog(@"Inside");
}
- (IBAction)image2Tapped:(id)sender {
    if (self.rightChoice==1) {
        self.level++;
        self.numberOfRightChoice++;
        self.score = self.score + 100;
        [self setupDisplay];
    }
    else{
        self.level++;
        self.lifeLeft --;
       [self setupDisplay];
    }
}
- (IBAction)image3Tapped:(id)sender {
    if (self.rightChoice==2) {
        self.level++;
        self.numberOfRightChoice++;
        self.score = self.score + 100;
        [self setupDisplay];
    }
    else{
        self.level++;
        self.lifeLeft --;
        [self setupDisplay];
    }
}
- (IBAction)image4Tapped:(id)sender {
    if (self.rightChoice==3) {
        self.level++;
        self.numberOfRightChoice++;
        self.score = self.score + 100;
        [self setupDisplay];
    }
    else{
        self.level++;
        self.lifeLeft --;
        [self setupDisplay];
    }
}

- (void)setupDisplay{
    if (self.lifeLeft == 0) {
        [self stopPlaying];
    }
    self.rightChoice = rand()%4;
    self.levelLabel.text = [NSString stringWithFormat:@"Level %d",self.level];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",self.score];
    self.liveLeftLabel.text = [NSString stringWithFormat:@"%d",self.lifeLeft];
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

- (void)stopPlaying
{
    NSString *score = [NSString stringWithFormat:@"%d",self.score];
    NSLog(@"%@",score);
    [self.mem overWrittenHighScore:score];
    CYNIResultViewController * detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultVC"];
	detailVC.textForlabel = [NSString stringWithFormat:@"%d",self.score];
    detailVC.textForAnswer = [NSString stringWithFormat:@"%d",self.level];
    detailVC.textForRight = [NSString stringWithFormat:@"%d",self.numberOfRightChoice];
	detailVC.delegate = self;
	[self presentViewController:detailVC animated:YES completion:nil];

}

- (void) dismissMe:(UIViewController *) viewController {
    [self viewDidLoad];
	[self dismissViewControllerAnimated:YES completion:nil];
}


@end
