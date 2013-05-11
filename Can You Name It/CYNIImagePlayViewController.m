//
//  CYNIImagePlayViewController.m
//  Can You Name It
//
//  Created by Bui Tri Trung on 4/16/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIImagePlayViewController.h"
#import "CYNIData.h"
#import "CYNI_highScoreMemory.h"
#import "CYNIResultViewController.h"

@interface CYNIImagePlayViewController () <CYNIResultdelegate>
@property (weak, nonatomic) IBOutlet UILabel *word;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *liveLeftLabel;
@property (weak, nonatomic) IBOutlet UIButton *answerButton1;
@property (weak, nonatomic) IBOutlet UIButton *answerButton2;
@property (weak, nonatomic) IBOutlet UIButton *answerButton3;
@property (weak, nonatomic) IBOutlet UIButton *answerButton4;
@property (weak, nonatomic) IBOutlet UIImageView *heart1;
@property (weak, nonatomic) IBOutlet UIImageView *heart2;
@property (weak, nonatomic) IBOutlet UIImageView *heart3;
@property (weak, nonatomic) IBOutlet UIImageView *heart4;
@property (weak, nonatomic) IBOutlet UIImageView *heart5;
@property (strong,nonatomic) NSArray *heartArray;
@property (strong,nonatomic) CYNIData *data;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (nonatomic) int rightChoice;
@property (nonatomic) int numberOfRightChoice;
@property (nonatomic) int score;
@property (nonatomic) int level;
@property (nonatomic) int lifeLeft;
@property (nonatomic,strong) CYNI_highScoreMemory *mem;
@end

@implementation CYNIImagePlayViewController

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
    NSString* path = [[[NSBundle mainBundle] resourcePath] stringByAppendingFormat:@"/images/playscr2/heart.png"];
    UIImage *heart = [UIImage imageWithContentsOfFile:path];
    [self.heart1 setImage:heart];
    [self.heart2 setImage:heart];
    [self.heart3 setImage:heart];
    [self.heart4 setImage:heart];
    [self.heart5 setImage:heart];
    self.heartArray = [NSArray arrayWithObjects:self.heart1, self.heart2,self.heart3,self.heart4,self.heart5, nil];
    [self setupDisplay];
}
- (IBAction)stopPressed:(id)sender {
    [self stopPlaying];
}

- (IBAction)answerButton1Pressed:(id)sender {
    if (self.rightChoice==0) {
        self.level++;
        self.numberOfRightChoice++;
        self.score = self.score + 100;
        [self setupDisplay];
    }
    else{
        self.level++;
        self.lifeLeft --;
        [self.heartArray[self.lifeLeft] setImage:nil];
        [self setupDisplay];
    }
}
- (IBAction)answerButton2Pressed:(id)sender {
    if (self.rightChoice==1) {
        self.level++;
        self.numberOfRightChoice++;
        self.score = self.score + 100;
        [self setupDisplay];
    }
    else{
        self.level++;
        self.lifeLeft --;
        [self.heartArray[self.lifeLeft] setImage:nil];
        [self setupDisplay];
    }
}

- (IBAction)answerButton3Pressed:(id)sender {
    if (self.rightChoice==2) {
        self.level++;
        self.numberOfRightChoice++;
        self.score = self.score + 100;
        [self setupDisplay];
    }
    else{
        self.level++;
        self.lifeLeft --;
        [self.heartArray[self.lifeLeft] setImage:nil];
        [self setupDisplay];
    }
}
- (IBAction)answerButton4Pressed:(id)sender {
    if (self.rightChoice==3) {
        self.level++;
        self.numberOfRightChoice++;
        self.score = self.score + 100;
        [self setupDisplay];
    }
    else{
        self.level++;
        self.lifeLeft --;
        [self.heartArray[self.lifeLeft] setImage:nil];
        [self setupDisplay];
    }
}

- (void)setupDisplay{
    if (self.lifeLeft == 0) {
        [self stopPlaying];
    }
    self.rightChoice = rand()%4;
    self.levelLabel.text = [NSString stringWithFormat:@"Lv %d",self.level];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",self.score];
    self.liveLeftLabel.text = [NSString stringWithFormat:@"%d",self.lifeLeft];
    
    NSString* image1Name = [self.data takeRandomImage];
    
    NSString* image2Name;
    do {
        image2Name = [self.data takeRandomImage];
    } while ([image2Name isEqualToString:image1Name]);
    
    NSString* image3Name;
    do {
        image3Name = [self.data takeRandomImage];
    } while ([image3Name isEqualToString:image1Name] ||
             [image3Name isEqualToString:image2Name]);
    
    NSString* image4Name;
    do {
        image4Name = [self.data takeRandomImage];
    } while ([image4Name isEqualToString:image1Name] ||
             [image4Name isEqualToString:image2Name] ||
             [image4Name isEqualToString:image3Name]
             );
    
    switch (self.rightChoice) {
        case 0:
            [self.image1 setImage:[UIImage imageWithContentsOfFile:image1Name]];
            break;
        case 1:
            [self.image1 setImage:[UIImage imageWithContentsOfFile:image2Name]];
            break;
        case 2:
            [self.image1 setImage:[UIImage imageWithContentsOfFile:image3Name]];
            break;
        case 3:
            [self.image1 setImage:[UIImage imageWithContentsOfFile:image4Name]];
            break;
        default:
            break;
    }
    
    NSArray* components = [image1Name componentsSeparatedByString:@".jpg"];
    image1Name = [components objectAtIndex:0];
    [self.answerButton1 setTitle:image1Name forState:NULL];
    
    components = [image2Name componentsSeparatedByString:@".jpg"];
    image2Name = [components objectAtIndex:0];
    [self.answerButton2 setTitle:image2Name forState:NULL];
    
    components = [image3Name componentsSeparatedByString:@".jpg"];
    image3Name = [components objectAtIndex:0];
    [self.answerButton3 setTitle:image3Name forState:NULL];
    
    components = [image4Name componentsSeparatedByString:@".jpg"];
    image4Name = [components objectAtIndex:0];
    [self.answerButton4 setTitle:image4Name forState:NULL];
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
    detailVC.textForAnswer = [NSString stringWithFormat:@"%d",self.level-1];
    detailVC.textForRight = [NSString stringWithFormat:@"%d",self.numberOfRightChoice];
	detailVC.delegate = self;
	[self presentViewController:detailVC animated:YES completion:nil];
    
}

- (void) dismissMe:(UIViewController *) viewController {
    [self viewDidLoad];
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
