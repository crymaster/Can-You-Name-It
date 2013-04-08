//
//  CYNIModeViewController.h
//  Can You Name It
//
//  Created by hust4 on 4/6/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CYNIModeViewControllerDelegate;
@interface CYNIModeViewController : UIViewController
@property (weak,nonatomic) id <CYNIModeViewControllerDelegate> delegate;
@end

@protocol CYNIModeViewControllerDelegate <NSObject>
- (void)userDismissModeViewController: (CYNIModeViewController *)vc;
@end