//
//  ImagePlayTableCell.h
//  Can You Name It
//
//  Created by Bui Tri Trung on 5/11/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagePlayTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *playerAnswer;
@property (nonatomic, weak) IBOutlet UILabel *rightAnswer;
@property (nonatomic, weak) IBOutlet UIImageView *image;
@property (nonatomic, weak) IBOutlet UIImageView *check;

@end
