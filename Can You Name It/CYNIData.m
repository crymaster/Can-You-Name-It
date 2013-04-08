//
//  CYNIData.m
//  Can You Name It
//
//  Created by hust4 on 4/6/13.
//  Copyright (c) 2013 NGUYEN HOANG SON. All rights reserved.
//

#import "CYNIData.h"

@implementation CYNIData
- (id)initWithPackage:(NSString*)package{
    self = [super init];
    if(self){
        NSFileManager *filemng;
        filemng =[NSFileManager defaultManager];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        basePath = [NSString stringWithFormat:@"%@/%@",basePath,package];
        [filemng changeCurrentDirectoryPath:basePath];
        NSArray* file = [filemng contentsOfDirectoryAtPath:basePath error:nil];
        _imageArray = [[NSMutableArray alloc] initWithCapacity:file.count];
        NSString* imageName;
        NSLog(@"%d",file.count);
        for (int i=0,j=0; i<file.count; i++) {
            imageName = [file objectAtIndex:i];
            if ([imageName hasSuffix:@".jpg"]) {
                [_imageArray addObject:imageName];
                NSLog(@"%@",[_imageArray objectAtIndex:j]);
                j++;
            }
        } 
    }
    return self;
}

- (NSString*)takeRandomImage{
    NSString *temp;
    int index;
    do{
        index = rand()%self.imageArray.count;
        temp = [self.imageArray objectAtIndex:index];
    }while ([temp isEqualToString:@"0"]);
    return temp;
}
@end
