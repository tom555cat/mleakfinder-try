//
//  TlmLeakObjProxy.h
//  YYY123
//
//  Created by tongleiming on 2021/8/13.
//  Copyright © 2021 Hello World Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TlmLeakObjProxy : NSObject

+ (void)addLeakObj:(id)obj;

@end

NS_ASSUME_NONNULL_END
