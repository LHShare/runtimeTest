//
//  DynamicController.m
//  runtimeTest
//
//  Created by cheyifu on 2017/12/5.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import "DynamicController.h"
#import <objc/runtime.h>
#import "MyClass.h"

@interface DynamicController ()

@property (nonatomic) NSString *string;

@end

@implementation DynamicController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self dynamicCreateClass];
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blueColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowRadius = 18;
    view.layer.shadowOffset = CGSizeMake(18, 18);
    view.layer.shadowOpacity = 0.9;
    [self.view addSubview:view];
}


- (void)dynamicCreateClass
{
    //动态创建类
    Class cls = objc_allocateClassPair(MyClass.class, "MySubClass", 0);
    class_addMethod(cls, @selector(submethod1), (IMP)imp_submethod1, "v@:");
    class_replaceMethod(cls, @selector(method1), (IMP)imp_submethod1, "v@:");
    class_addIvar(cls, "_ivar1", sizeof(NSString *), log(sizeof(NSString *)), "i");

    objc_property_attribute_t type = {"T","@\"Nsstring\""};
    objc_property_attribute_t ownership = {"C",""};
    objc_property_attribute_t backingivar = {"V","_ivar1"};
    objc_property_attribute_t attrs[] = {type,ownership,backingivar};

    class_addProperty(cls, "property2", attrs, 3);
    objc_registerClassPair(cls);

    id instance = [[cls alloc]init];
    [instance performSelector:@selector(submethod1)];
    [instance performSelector:@selector(method1)];
    
}

- (void)dynamicCreateObject
{
    id theObject = class_createInstance(NSString.class, sizeof(unsigned));
    id str1 = [theObject init];
    NSLog(@"%@",[str1 class]);
    id str2 = [[NSString alloc] initWithString:@"test"];
    NSLog(@"%@",[str2 class]);
}

void imp_submethod1()
{
    NSLog(@"执行imp_submethod1");
}

- (void)submethod1
{
    NSLog(@"执行submethod1");
}
@end
