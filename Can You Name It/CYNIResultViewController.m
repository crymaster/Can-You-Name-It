//
//  CYNIResultViewController.m
//  Can You Name It
//
//  Created by hust4 on 4/14/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIResultViewController.h"

@interface CYNIResultViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *AnswerNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *RightNumLabel;

@end

@implementation CYNIResultViewController

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
    self.displayLabel.text = self.textForlabel;
    self.AnswerNumLabel.text = self.textForAnswer;
    self.RightNumLabel.text = self.textForRight;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playAgainPressed:(id)sender {
    [self.delegate dismissMe:self];
}


@end
