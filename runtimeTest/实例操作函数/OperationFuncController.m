//
//  OperationFuncController.m
//  runtimeTest
//
//  Created by cheyifu on 2017/12/5.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import "OperationFuncController.h"
#import <objc/runtime.h>

@interface OperationFuncController ()

@end

@implementation OperationFuncController

- (void)viewDidLoad {
    [super viewDidLoad];
}

void testOperationFunc()
{
    int numClasses;
    Class * classes = NULL;
    numClasses = objc_getClassList(NULL, 0);
    
//    if (numClasses > 0) {
//        classes = malloc(sizeof(Class) * numClasses);
//        numClasses = objc_getClassList(classes, numClasses);
//        NSLog(@"number of classes : %d",numClasses);
//        for (int i = 0; i < numClasses; i++) {
//            Class cls = classes[i];
//            NSLog(@"class name : %s",class_getName(cls));
//        }
//        free(classes);
//    }
}


@end
