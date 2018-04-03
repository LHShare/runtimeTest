//
//  MyClass.h
//  runtimeTest
//
//  Created by cheyifu on 2017/12/4.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject<NSCopying, NSCoding>

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, copy) NSString *string;
- (void)method1;
- (void)method2;
+ (void)classMethod1;

@end
