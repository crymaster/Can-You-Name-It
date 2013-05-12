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
@property (weak, nonatomic) IBOutlet UIImageView *cross;
@property (weak, nonatomic) IBOutlet UIImageView *tick;
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
    self.tick.alpha = 0;
    self.cross.alpha = 0;
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

- (void)correctNumber:(int)no{
    CGRect rect = self.tick.frame;
    double x = 230;
    switch (no) {
        case 0:
            rect.origin.x =x;
            rect.origin.y =243;
            break;
        case 1:
            rect.origin.x =x;
            rect.origin.y =300;
            break;
        case 2:
            rect.origin.x =x;
            rect.origin.y =360;
            break;
        case 3:
            rect.origin.x =x;
            rect.origin.y =420;
            break;
        default:
            break;
    }
    self.tick.frame=rect;
    rect.origin.y+=70;
    [UIView animateWithDuration:1.5
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.tick.frame=rect;
                     }
                     completion:nil];
    
    [UIView animateWithDuration:1.5
                          delay:0
                        options:UIViewAnimationCurveEaseInOut
                     animations:^{
                         self.tick.alpha = 1;
                     }
                     completion:^(BOOL finished){
                         if(finished){
                             self.level++;
                             self.numberOfRightChoice++;
                             self.score = self.score + 100;
                             [UIView animateWithDuration:1
                                              animations:^{self.tick.alpha = 0;}
                                              completion:^(BOOL finished){
                                                  if (finished) {
                                                      [self setupDisplay];
                                                  }
                                              }
                              ];
                         }
                     }];
}

- (void)wrongNumber:(int)no{
    CGRect rect = self.cross.frame;
    CGRect rect1 = self.tick.frame;
    double x = 230;
    switch (no) {
        case 0:
            rect.origin.x =x;
            rect.origin.y =243;
            break;
        case 1:
            rect.origin.x =x;
            rect.origin.y =300;
            break;
        case 2:
            rect.origin.x =x;
            rect.origin.y =360;
            break;
        case 3:
            rect.origin.x =x;
            rect.origin.y =420;
            break;
        default:
            break;
    }
    self.cross.frame=rect;
    rect.origin.y += 70;
    switch (self.rightChoice) {
        case 0:
            rect1.origin.x =x;
            rect1.origin.y =243;
            break;
        case 1:
            rect1.origin.x =x;
            rect1.origin.y =300;
            break;
        case 2:
            rect1.origin.x =x;
            rect1.origin.y =360;
            break;
        case 3:
            rect1.origin.x =x;
            rect1.origin.y =420;
            break;
        default:
            break;
    }
    self.tick.frame=rect1;
    rect1.origin.y += 70;
    [UIView animateWithDuration:1.5
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.cross.frame=rect;
                     }
                     completion:nil];
    [UIView animateWithDuration:1.5
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.tick.frame=rect1;
                     }
                     completion:nil];
    [UIView animateWithDuration:1.5
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         self.tick.alpha=1;
                     }
                     completion:^(BOOL finished){
                         if(finished){
                             [UIView animateWithDuration:1
                                              animations:^{self.tick.alpha = 0;}
                              ];
                         }
                     }];
    [UIView animateWithDuration:1.5
                          delay:0
                        options:UIViewAnimationCurveLinear
                     animations:^{
                         self.cross.alpha = 1;
                     }
                     completion:^(BOOL finished){
                         if(finished){
                             self.level++;
                             self.lifeLeft --;
                             [self.heartArray[self.lifeLeft] setImage:nil];
                             [UIView animateWithDuration:1
                                              animations:^{self.cross.alpha = 0;}
                                              completion:^(BOOL finished){
                                                  if (finished) {
                                                      [self setupDisplay];
                                                  }
                                              }
                              ];
                         }
                     }];
}

- (IBAction)answerButton1Pressed:(id)sender {
    if (self.rightChoice==0) {
        [self correctNumber:0];
    }
    else{
        [self wrongNumber:0];
    }
}
- (IBAction)answerButton2Pressed:(id)sender {
    if (self.rightChoice==1) {
        [self correctNumber:1];
    }
    else{
        [self wrongNumber:1];
    }
}

- (IBAction)answerButton3Pressed:(id)sender {
    if (self.rightChoice==2) {
        [self correctNumber:2];
    }
    else{
        [self wrongNumber:2];
    }
}
- (IBAction)answerButton4Pressed:(id)sender {
    if (self.rightChoice==3) {
        [self correctNumber:3];
    }
    else{
        [self wrongNumber:3];
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
    
    NSArray* components;
    if ([image1Name hasSuffix:@".jpg"]) {
        components = [image1Name componentsSeparatedByString:@".jpg"];
    }
    else{
        components = [image1Name componentsSeparatedByString:@".png"];
    }
    image1Name = [components objectAtIndex:0];
    [self.answerButton1 setTitle:image1Name forState:NULL];
    
    if ([image2Name hasSuffix:@".jpg"]) {
        components = [image2Name componentsSeparatedByString:@".jpg"];
    }
    else{
        components = [image2Name componentsSeparatedByString:@".png"];
    }
    image2Name = [components objectAtIndex:0];
    [self.answerButton2 setTitle:image2Name forState:NULL];
    
    if ([image3Name hasSuffix:@".jpg"]) {
        components = [image3Name componentsSeparatedByString:@".jpg"];
    }
    else{
        components = [image3Name componentsSeparatedByString:@".png"];
    }
    image3Name = [components objectAtIndex:0];
    [self.answerButton3 setTitle:image3Name forState:NULL];
    
    if ([image4Name hasSuffix:@".jpg"]) {
        components = [image4Name componentsSeparatedByString:@".jpg"];
    }
    else{
        components = [image4Name componentsSeparatedByString:@".png"];
    }
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
    CYNIResultViewController * detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultVC"];
    detailVC.highScoreFlag = [self.mem overWrittenHighScore:score];
    detailVC.textForHighScore = [self.mem loadScore];
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
