//
//  WriteDate.m
//  CZ
//
//  Created by el1ven on 14-3-3.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import "WriteDate.h"

@implementation WriteDate

-(void)runWirte
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = NSHomeDirectory();
    NSString *filePath = [path stringByAppendingPathComponent:@"/DeskTop/haha.txt"];
    BOOL success = [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    if(success){
        NSLog(@"Create Success!");
    }
    
    NSFileHandle *writeFileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:writeFileHandle repeats:YES];
    
}

-(void)timeAction:(NSTimer *)timer
{
    static int count = 0;
    
    NSFileHandle *fileHandle = timer.userInfo;
    [fileHandle seekToEndOfFile];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy/MM/dd hh:mm:ss"];
    NSString *dateString = [dateFormat stringFromDate:date];
    dateString = [dateString stringByAppendingString:@"\n"];
    NSData *data = [dateString dataUsingEncoding:NSUTF8StringEncoding];
    [fileHandle writeData:data];
    
    if(count == 10){
        [timer invalidate];
        [fileHandle closeFile];
        
    }
    
    count++;
}
@end
