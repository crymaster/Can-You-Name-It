//
//  CYNIStatisticViewController.m
//  Can You Name It
//
//  Created by hust4 on 5/2/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIStatisticViewController.h"
#import "ImagePlayTableCell.h"
#import "WordPlayTableCell.h"

@interface CYNIStatisticViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CYNIStatisticViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)  tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.statisticData getNumberQuestion];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger cellnum = indexPath.row;
    Question *question = [self.statisticData getQuestion:cellnum];
    
    if([question.playerAnswer rangeOfString:@"jpg"].location == NSNotFound)
    {
        
        static NSString *simpleTableIdentifier = @"ImagePlayTableCell";
        
        ImagePlayTableCell *cell = (ImagePlayTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ImagePlayTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        if(cellnum % 2 == 0)
        {
            UIView *viewSelected = [[UIView alloc] init];
            viewSelected.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"/images/statistic/cell1.png"]];
            [cell setBackgroundView:viewSelected];
        }
        else
        {
            UIView *viewSelected = [[UIView alloc] init];
            viewSelected.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"/images/statistic/cell2.png"]];
            [cell setBackgroundView:viewSelected];
        }
        
        NSString *playerAnswer = question.playerAnswer;
        NSString *rightAnswer = question.imageName;
        [cell.image setImage:[UIImage imageWithContentsOfFile:rightAnswer]];
        NSArray *components = [rightAnswer componentsSeparatedByString:@".jpg"];
        rightAnswer = [components objectAtIndex:0];
        
        if([playerAnswer isEqualToString:rightAnswer])
        {
            cell.playerAnswer.text = playerAnswer;
            cell.rightAnswer.text = @"";
            [cell.check setImage:[UIImage imageNamed:@"/images/statistic/tick.png"]];
        }
        else
        {
            cell.playerAnswer.text = playerAnswer;
            cell.rightAnswer.text = rightAnswer;
            [cell.check setImage:[UIImage imageNamed:@"/images/statistic/cross.png"]];
        }
        return cell;
    }
    else
    {
        
        static NSString *simpleTableIdentifier = @"WordPlayTableCell";
        
        WordPlayTableCell *cell = (WordPlayTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WordPlayTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        if(cellnum % 2 == 0)
        {
            UIView *viewSelected = [[UIView alloc] init];
            viewSelected.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"/images/statistic/cell1.png"]];
            [cell setBackgroundView:viewSelected];
        }
        else
        {
            UIView *viewSelected = [[UIView alloc] init];
            viewSelected.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"/images/statistic/cell2.png"]];
            [cell setBackgroundView:viewSelected];
        }
        
        NSString *playerAnswer = question.playerAnswer;
        NSString *rightAnswer = question.imageName;
        [cell.answerImage setImage:[UIImage imageWithContentsOfFile:playerAnswer]];
        
        if([playerAnswer isEqualToString:rightAnswer])
        {
            [cell.check setImage:[UIImage imageNamed:@"/images/statistic/tick.png"]];
            [cell.rightImage setImage:[UIImage imageNamed:@"/images/statistic/transparent.png"]];
        }
        else
        {
            [cell.rightImage setImage:[UIImage imageWithContentsOfFile:rightAnswer]];
            [cell.check setImage:[UIImage imageNamed:@"/images/statistic/cross.png"]];
        }
        
        NSArray *components = [rightAnswer componentsSeparatedByString:@".jpg"];
        rightAnswer = [components objectAtIndex:0];
        cell.question.text = rightAnswer;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

- (IBAction)backPressed:(id)sender {
    [self.delegate dismissMe:self];
}


@end
