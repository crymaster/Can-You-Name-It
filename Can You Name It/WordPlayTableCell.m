//
//  WordPlayTableCell.m
//  Can You Name It
//
//  Created by Bui Tri Trung on 5/12/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "WordPlayTableCell.h"

@implementation WordPlayTableCell

@synthesize question = _question;
@synthesize answerImage = _answerImage;
@synthesize rightImage = _rightImage;
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
