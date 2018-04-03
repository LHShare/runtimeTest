//
//  MyClass.m
//  runtimeTest
//
//  Created by cheyifu on 2017/12/4.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import "MyClass.h"

@interface MyClass() {
    NSInteger _instance1;
    NSString *_instance2;
}
@property (nonatomic, assign) NSUInteger integer;
- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2;

@end

@implementation MyClass

+ (void)classMethod1
{
    
}

- (void)method1
{
    NSLog(@"----执行method1----");
}

- (void)method2
{
    
}

- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)arg2
{
    
}

@end
