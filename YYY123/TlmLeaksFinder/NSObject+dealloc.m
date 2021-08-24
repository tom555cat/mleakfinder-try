//
//  NSObject+dealloc.m
//  Testqwe
//
//  Created by tom555cat on 2021/8/11.
//  Copyright © 2021 tom555cat. All rights reserved.
//

#import "NSObject+dealloc.h"
#import "TlmLeakObjProxy.h"
#import <objc/runtime.h>

static const char *stackViewKey;
static const char *leakObjProxyKey;

@implementation NSObject (dealloc)

- (BOOL)tlmWillDealloc
{
    __weak id weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong id strongSelf = weakSelf;
        // 如果strongSelf为nil，直接不执行，省去了判断strongSelf是否存在这一步
        [strongSelf tlmAssertNotDealloc];

//        __strong typeof(weakSelf) self = weakSelf;
//        if (self) {
//            NSLog(@"------ %@, 未释放", self);
//        }
    });
    
    return YES;
}

- (void)tlmAssertNotDealloc
{
    NSLog(@"------ %@, %@, 未释放", [self class], self);
    NSLog(@"------ stack view: %@", [self stackView]);
    
    [TlmLeakObjProxy addLeakObj:self];
}

- (void)setStackView:(NSArray *)stackView
{
    objc_setAssociatedObject(self, &stackViewKey, stackView, OBJC_ASSOCIATION_RETAIN);
}

- (NSArray *)stackView
{
    NSArray *array = objc_getAssociatedObject(self, &stackViewKey);
    if (!array) {   // 检查view的stack，如果没有，则从自己算起
        array = [NSArray arrayWithObjects:NSStringFromClass([self class]), nil];
        [self setStackView:array];
    }
    
    return array;
}

- (void)tlmWillReleaseChild:(id)child
{
    [self tlmWillReleaseChildren:@[child]];
}

- (void)tlmWillReleaseChildren:(NSArray *)children
{
    NSArray *stackView = self.stackView;
    for (id child in children) {  // 每个view的stackView都保存了从自己到祖先view的路径
        NSMutableArray *stack = [NSMutableArray arrayWithArray:stackView];
        [stack addObjectsFromArray:[child stackView]];
        [child setStackView:[stack copy]];
        [child tlmWillDealloc];
    }
}

@end
