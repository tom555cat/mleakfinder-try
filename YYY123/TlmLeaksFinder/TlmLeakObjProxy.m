//
//  TlmLeakObjProxy.m
//  YYY123
//
//  Created by tongleiming on 2021/8/13.
//  Copyright © 2021 Hello World Corporation. All rights reserved.
//

#import "TlmLeakObjProxy.h"
#import "NSObject+dealloc.h"
#import <objc/runtime.h>

static NSMutableSet *leakedObjectPtrs;

@interface TlmLeakObjProxy ()

@property (nonatomic, weak) id obj;
@property (nonatomic, strong) NSArray *stackView;

@end

@implementation TlmLeakObjProxy

+ (void)addLeakObj:(id)obj
{
    TlmLeakObjProxy *proxy = [TlmLeakObjProxy new];
    proxy.obj = obj;
    // 有些东西会随着代理的对象obj的释放而释放，比如obj的关联stackView，所以需要
    // 后续输出的内容需要让代理来持有，防止被释放
    proxy.stackView = [obj stackView];
    
    // 为了让proxy存活，让obj持有proxy，obj是id，无法暴露自定义的属性
    objc_setAssociatedObject(obj, <#const void * _Nonnull key#>, proxy, OBJC_ASSOCIATION_RETAIN);
    obj.leakObjProxy = proxy;
    
}

//
- (void)dealloc
{
    // 为什么要这么绕一下?
    NSArray *viewStack = _stackView;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"---Object Deallocted---");
        NSLog(@"%@", viewStack);
    });
}

@end
