//
//  UIView+tlmLeaks.m
//  YYY123
//
//  Created by tongleiming on 2021/8/24.
//  Copyright © 2021 Hello World Corporation. All rights reserved.
//

#import "UIView+tlmLeaks.h"
#import "NSObject+dealloc.h"

@implementation UIView (tlmLeaks)

- (BOOL)tlmWillDealloc
{
    if (![super tlmWillDealloc]) {
        return NO;
    }
    
    [self tlmWillReleaseChildren:self.subviews];
    
    return YES;
}

@end
