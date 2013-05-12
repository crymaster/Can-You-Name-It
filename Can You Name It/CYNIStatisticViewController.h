//
//  CYNIStatisticViewController.h
//  Can You Name It
//
//  Created by hust4 on 5/2/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatisticData.h"

@protocol CYNIStatisticDelegate <NSObject>

- (void) dismissMe: (UIViewController *) viewController;

@end

@interface CYNIStatisticViewController : UIViewController

@property (strong, nonatomic) StatisticData *statisticData;
@property (strong, nonatomic) NSString *textForlabel;
@property (strong, nonatomic) NSString *textForAnswer;
@property (strong, nonatomic) NSString *textForRight;
@property (strong, nonatomic) NSString *textForHighScore;
@property (nonatomic) int highScoreFlag;
@property (weak, nonatomic) id<CYNIStatisticDelegate> delegate;

@end
