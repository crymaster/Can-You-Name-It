//
//  CYNIHighScoreController.m
//  Can You Name It
//
//  Created by hust4 on 4/14/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIHighScoreController.h"
#import "CYNI_highScoreMemory.h"

@interface CYNIHighScoreController ()
@property (nonatomic,strong) CYNI_highScoreMemory *mem;

@end

@implementation CYNIHighScoreController
@synthesize mem = _mem;

- (CYNI_highScoreMemory *) mem
{
    if (!_mem) {
        _mem = [[CYNI_highScoreMemory alloc] init];
    }
    return _mem;
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
    NSString *loadString = [self.mem loadScore];
    [label setText:loadString];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
