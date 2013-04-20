//
//  CYNIResultViewController.h
//  Can You Name It
//
//  Created by hust4 on 4/14/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CYNIResultdelegate <NSObject>
- (void) dismissMe: (UIViewController *) viewController;
@end

@interface CYNIResultViewController : UIViewController
@property (strong, nonatomic) NSString *textForlabel;
@property (strong, nonatomic) NSString *textForAnswer;
@property (strong, nonatomic) NSString *textForRight;
@property (weak, nonatomic) id<CYNIResultdelegate> delegate;
@end
