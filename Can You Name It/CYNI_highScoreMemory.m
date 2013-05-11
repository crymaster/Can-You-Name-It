//
//  CYNI_highScoreMemory.m
//  Can You Name It
//
//  Created by hust4 on 4/14/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNI_highScoreMemory.h"
@interface CYNI_highScoreMemory()
@end

@implementation CYNI_highScoreMemory

- (void)saveScore: (NSString *)score{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:score forKey:@"savestring"];
    [defaults synchronize];
    NSLog(@"saved !");
}
- (NSString *)loadScore{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadstring = [defaults objectForKey:@"savestring"];
    NSLog(@"load !");
    return loadstring;
}
- (int)overWrittenHighScore: (NSString *)currentScore{
    NSString *currentHighScore = [self loadScore];
    int intCurrentHighScore = [currentHighScore intValue];
    int intCurrentScore = [currentScore intValue];
    if (intCurrentHighScore > intCurrentScore) {
        NSLog(@"Don't update high score !");
        return 0;
        
    }
    [self saveScore:currentScore];
    NSLog(@"update high score !");
    return 1;
}

@end
