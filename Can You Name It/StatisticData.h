//
//  StatisticData.h
//  Can You Name It
//
//  Created by Bui Tri Trung on 5/11/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface StatisticData : NSObject

-(void) addQuestion: (Question *) question;
-(Question *) getQuestion: (NSInteger) index;
-(int) getNumberQuestion;
-(void) clear;

@end
