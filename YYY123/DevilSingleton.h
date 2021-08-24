//
//  DevilSingleton.h
//  YYY123
//
//  Created by tongleiming on 2021/8/24.
//  Copyright © 2021 Hello World Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DevilSingleton : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) UIView *holder;

@end

NS_ASSUME_NONNULL_END
