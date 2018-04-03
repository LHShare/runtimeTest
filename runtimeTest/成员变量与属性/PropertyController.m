//
//  PropertyController.m
//  runtimeTest
//
//  Created by cheyifu on 2017/12/5.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import "PropertyController.h"
#import <objc/runtime.h>

@interface PropertyController ()

@property (nonatomic, copy) NSString *string1;
@property (nonatomic, copy) NSString *string2;

@end

@implementation PropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self protocalTest];
    
}

- (void)protocalTest
{
    
    id LenderClass = objc_getClass("PropertyController");
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList(LenderClass, &outCount);
    
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        fprintf(stdout, "%s %s\n",property_getName(property),property_getAttributes(property));
    }
}


@end
