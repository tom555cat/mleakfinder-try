//
//  UIViewController+dismiss.m
//  Testqwe
//
//  Created by tom555cat on 2021/8/11.
//  Copyright © 2021 tom555cat. All rights reserved.
//

#import "UIViewController+dismiss.h"
#import <objc/runtime.h>
#import "NSObject+dealloc.h"

@implementation UIViewController (dismiss)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [self class];
        Method method1 = class_getInstanceMethod(cls, @selector(dismissViewControllerAnimated:completion:));
        Method method2 = class_getInstanceMethod(cls, @selector(_tlm_dismissViewControllerAnimated:completion:));
        method_exchangeImplementations(method1, method2);
    });
}

- (void)_tlm_dismissViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion
{
    [self _tlm_dismissViewControllerAnimated:flag completion:completion];
    [self tlmWillDealloc];
}

@end
