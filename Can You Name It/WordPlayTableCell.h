//
//  WordPlayTableCell.h
//  Can You Name It
//
//  Created by Bui Tri Trung on 5/12/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordPlayTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *question;
@property (nonatomic, weak) IBOutlet UIImageView *answerImage;
@property (nonatomic, weak) IBOutlet UIImageView *rightImage;
@property (nonatomic, weak) IBOutlet UIImageView *check;

@end
