//
//  ImagePlayTableCell.m
//  Can You Name It
//
//  Created by Bui Tri Trung on 5/11/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "ImagePlayTableCell.h"

@implementation ImagePlayTableCell

@synthesize playerAnswer = _playerAnswer;
@synthesize rightAnswer = _rightAnswer;
@synthesize image = _image;
@synthesize check = _check;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
