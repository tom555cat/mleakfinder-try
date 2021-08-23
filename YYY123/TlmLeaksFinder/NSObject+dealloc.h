//
//  NSObject+dealloc.h
//  Testqwe
//
//  Created by tom555cat on 2021/8/11.
//  Copyright © 2021 tom555cat. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TlmLeakObjProxy;

@interface NSObject (dealloc)

@property (nonatomic, strong) NSArray *stackView;
//@property (nonatomic, strong) TlmLeakObjProxy *leakObjProxy;

- (void)tlmWillDealloc;
- (void)tlmWillReleaseChild:(id)child;
- (void)tlmWillReleaseChildren:(NSArray *)children;

@end

NS_ASSUME_NONNULL_END
