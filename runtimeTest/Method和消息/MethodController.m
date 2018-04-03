//
//  MethodController.m
//  runtimeTest
//
//  Created by cheyifu on 2017/12/5.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import "MethodController.h"
#import <objc/runtime.h>

@interface MethodController ()

@end

@implementation MethodController

- (void)viewDidLoad {
    [super viewDidLoad];
}


+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(lh_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)lh_viewWillAppear:(BOOL)animated
{
    [self lh_viewWillAppear:animated];
    NSLog(@"viewWillAppear : %@",self);
}

@end
