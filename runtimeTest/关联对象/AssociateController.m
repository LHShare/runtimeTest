//
//  AssociateController.m
//  runtimeTest
//
//  Created by cheyifu on 2017/12/5.
//  Copyright © 2017年 cheyifu. All rights reserved.
//

#import "AssociateController.h"
#import <objc/runtime.h>

@interface AssociateController ()

@end

@implementation AssociateController

static char kDTActionHandlerTapBlockKey;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTapActionWithBlock:^{
        NSLog(@"hollo world");
    }];
}


- (void)setTapActionWithBlock:(void (^)(void))block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerTapBlockKey);
    if (!gesture) {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
        [self.view addGestureRecognizer:gesture];
        //将创建的手势对象和block作为关联对象
        objc_setAssociatedObject(self, &kDTActionHandlerTapBlockKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kDTActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

//手势识别对象的target和action
- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerTapBlockKey);
        
        if (action)
        {
            action();
        }
    }
}


@end
