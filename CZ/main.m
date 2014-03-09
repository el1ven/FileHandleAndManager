//
//  main.m
//  CZ
//
//  Created by el1ven on 14-2-21.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WriteDate.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        /*
        //追加数据
        NSString *homePath = NSHomeDirectory();
        NSString *filePath = [homePath stringByAppendingPathComponent:@"/DeskTop/test.txt"];
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
        
        [fileHandle seekToEndOfFile];
        NSString *str = @"追加的数据";
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        
        [fileHandle writeData:data];
        [fileHandle closeFile];*/
        
        
        /*
        //定位读取数据
        NSString *homePath = NSHomeDirectory();
        NSString *filePath = [homePath stringByAppendingPathComponent:@"/DeskTop/test.txt"];
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
        NSUInteger length = [fileHandle availableData].length;
        [fileHandle seekToFileOffset:length/2];
        NSData *data = [fileHandle readDataToEndOfFile];
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"homedirectory：%@",homePath);
        NSLog(@"读取的数据为：%@",str);*/
        
        /*//复制文件，把源文件的内容读出来然后写到目标文件之中
        
        NSString *homePath = NSHomeDirectory();
        NSString *sourcePath = [homePath stringByAppendingPathComponent:@"/DeskTop/test.txt"];//源文件，已经存在并且里面有内容
        
        NSString *targetPath = [homePath stringByAppendingPathComponent:@"/DeskTop/test-copy.txt"];//目标文件，不存在
        
        NSFileManager *fileManager = [NSFileManager defaultManager]; //创建空的目标文件
        BOOL success = [fileManager createFileAtPath:targetPath contents:nil attributes:nil];
        if (success) {
            NSLog(@"Create success!");
        };
        
        NSFileHandle *writeFileHandle = [NSFileHandle fileHandleForWritingAtPath:targetPath];
        NSFileHandle *readFileHandle = [NSFileHandle fileHandleForReadingAtPath:sourcePath];
        
        NSData *data = [readFileHandle readDataToEndOfFile];
        [writeFileHandle writeData:data];
        
        [writeFileHandle closeFile];
        [readFileHandle closeFile];*/
        
        /*
        //第一个作业
        WriteDate *writeDate = [[WriteDate alloc]init];
        
        [writeDate runWirte];
      
        [[NSRunLoop currentRunLoop]run];*/
        
        //第二个作业
        NSString *homePath = NSHomeDirectory();//获取根目录的路径
        NSString *srcPath = [homePath stringByAppendingString:@"/DeskTop/HongKong.txt"];//通过字符串追加的方式获取源文件的路径
        NSString *targetPath = [homePath stringByAppendingString:@"/DeskTop/HongKong123.txt"];//目标文件，是需要新创建的
        
        NSFileManager *fileManager = [NSFileManager defaultManager];//利用NSFileManager来“创建”文件
        BOOL success = [fileManager createFileAtPath:targetPath contents:nil attributes:nil];
        if(success){
            NSLog(@"target file create success!");
        }
        
        //读文件和写文件用fileHandle,它不能创建文件的
        NSFileHandle *readFile = [NSFileHandle fileHandleForReadingAtPath:srcPath];
        NSFileHandle *writeFile = [NSFileHandle fileHandleForWritingAtPath:targetPath];
        
        NSDictionary *fileAttribute = [fileManager attributesOfItemAtPath:srcPath error:nil];//用这个来获取文件大小而不跳转偏移量
        NSNumber *fileSizeNum = [fileAttribute objectForKey:NSFileSize];
        
        BOOL isNotEnd = YES;//检查文件是否读到了末尾
        NSInteger readSize = 0;//已经读取的文件大小
        NSInteger fileSize = [fileSizeNum longValue];//将NSNumber转化为NSInteger
        
        while (isNotEnd){
            NSData *data = nil;//读取的文件数据存到这里
            NSInteger subLength = fileSize - readSize;//剩下的数据
            if(subLength <500){
                [readFile readDataToEndOfFile];
                isNotEnd = NO;//读取结束,就是到了结尾
            }else{
                data = [readFile readDataOfLength:500];
                readSize += 500;
                [readFile seekToFileOffset:readSize];
                NSLog(@"123");//用于检测
            }
            
            [writeFile writeData:data];//写入到目标文件
            
        }
        
        [writeFile closeFile];//关闭FileHandle
        [readFile closeFile];
        
        
        
        
        
        
        
        
        
        

        
        
        
           }
    
    return 0;
}

