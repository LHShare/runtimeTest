//
//  ProtocolController.m
//  runtimeTest
//
//  Created by cheyifu on 2017/12/5.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import "ProtocolController.h"
#import "CategoryClass.h"
#import "CategoryClass+CategoryClass1.h"
#import <objc/runtime.h>

@interface ProtocolController ()

@end



@implementation ProtocolController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CategoryClass *cc = [[CategoryClass alloc] init];
//    [cc method1];
//    [cc method2];
//    [self categoryTest];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    Class s = [UIButton superclass];
    Class c1 = [UIButton class];
    NSLog(@"%p--%p",s,c1);
    Class c = [button class];
    Class s1 = [button superclass];
    NSLog(@"%p--%p",c,s1);
    NSLog(@"%p--%p",[button class],c1);
    if ([UIButton isKindOfClass:[UIButton class]]) {
        NSLog(@"ss");
    } else {
        NSLog(@"ff");
    }
}

- (void)categoryTest
{
    unsigned int outCount = 0;
    Method *methodList = class_copyMethodList(CategoryClass.class, &outCount);
    
    for (int i = 0; i < outCount; i++) {
        Method method = methodList[i];
        const char *name = sel_getName(method_getName(method));
        NSLog(@"CategoryClass's method : %s", name);
        if (strcmp(name, sel_getName(@selector(method2)))) {
            NSLog(@"分类方法method2在objc_class的方法列表中");
        }
    }
}


@end
