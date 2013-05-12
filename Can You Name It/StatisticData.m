//
//  StatisticData.m
//  Can You Name It
//
//  Created by Bui Tri Trung on 5/11/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "StatisticData.h"

@interface StatisticData ()

@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation StatisticData

-(NSMutableArray *) data {
    if(_data == nil)
        _data = [[NSMutableArray alloc] init];
    return _data;
}

-(void) addQuestion: (Question *) question {
    [self.data addObject:question];
}

-(Question *) getQuestion: (NSInteger) index {
    return (Question *)[self.data objectAtIndex:index];
}

-(int) getNumberQuestion {
    return self.data.count;
}

-(void) clear {
    [self.data removeAllObjects];
}

@end