//
//  NSObject+dealloc.m
//  Testqwe
//
//  Created by tom555cat on 2021/8/11.
//  Copyright © 2021 tom555cat. All rights reserved.
//

#import "NSObject+dealloc.h"

@implementation NSObject (dealloc)

- (void)tlmWillDealloc
{
    __weak id weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        if (weakSelf) {
            NSLog(@"------ %@, 未释放", weakSelf);
        }

//        __strong typeof(weakSelf) self = weakSelf;
//        if (self) {
//            NSLog(@"------ %@, 未释放", self);
//        }
    });
}

//- (void)dealloc
//{
//    // 打印当前对象
//
//}

@end
