//
//  DevilSingleton.m
//  YYY123
//
//  Created by tongleiming on 2021/8/24.
//  Copyright © 2021 Hello World Corporation. All rights reserved.
//

#import "DevilSingleton.h"

@implementation DevilSingleton

+ (instancetype)sharedInstance
{
    static DevilSingleton *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [DevilSingleton new];
    });
    return instance;
}

@end
