//
//  ViewController.m
//  runtimeTest
//
//  Created by cheyifu on 2017/12/4.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self ex_registerClassPair];
    [self ClassTest];
}

/*
- (void)ex_registerClassPair {
    
    Class newClass = objc_allocateClassPair([NSError class], "TestClass", 0);
    class_addMethod(newClass, @selector(testMetaClass), (IMP)TestMetaClass, "v@:");
    objc_registerClassPair(newClass);
    id instance = [[newClass alloc] initWithDomain:@"some domain" code:0 userInfo:nil];
    [instance performSelector:@selector(testMetaClass)];
}

void TestMetaClass(id self,SEL _cmd) {
    
    NSLog(@"This object is %p",self);
    NSLog(@"Class is %@,super class is %@",[self class],[self superclass]);
    
    Class currentClass = [self class];
    for (int i = 0; i < 4; i++) {
        NSLog(@"Following the isa pointer %d times gives %p",i,currentClass);
        //通过objc_getClass获得对象isa，这样可以回溯到Root class及NSObject的meta class，可以看到最后指针指向的是0x0和NSObject的meta class类地址一样
        currentClass = objc_getClass((__bridge void *)currentClass);
    }
    
    NSLog(@"NSObject's class is %p",[NSObject class]);
    NSLog(@"NSObject's meta class is %p",objc_getClass((__bridge void *)[NSObject class]));
}
*/

- (void)ClassTest
{
    BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];//NSObject,NSObject
    BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];//NSMetaObject,NSObject
    BOOL res3 = [(id)[ViewController class] isKindOfClass:[ViewController class]];//UIViewControllerMeta,ViewController
    BOOL res4 = [(id)[ViewController class] isMemberOfClass:[ViewController class]];//ViewControllerMeta,ViewController
    NSLog(@"%d--%d--%d--%d",res1,res2,res3,res4);
}
@end
