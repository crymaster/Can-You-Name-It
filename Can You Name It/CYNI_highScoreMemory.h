//
//  CYNI_highScoreMemory.h
//  Can You Name It
//
//  Created by hust4 on 4/14/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYNI_highScoreMemory : NSObject

- (int)overWrittenHighScore: (NSString *)currentScore;
- (void)saveScore: (NSString *)score;
- (NSString *)loadScore;
@end
