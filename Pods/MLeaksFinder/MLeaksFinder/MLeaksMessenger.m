//
//  MLeaksMessenger.m
//  MLeaksFinder
//
//  Created by 佘泽坡 on 7/17/16.
//  Copyright © 2016 zeposhe. All rights reserved.
//

#import "MLeaksMessenger.h"

BOOL MLeaksFinder_ShouldShowAlertView = NO;

@implementation MLeaksMessenger

+ (BOOL)shouldAlert
{
    return MLeaksFinder_ShouldShowAlertView;
}

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message handler:(void (^ __nullable)(UIAlertAction *action))handler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:handler];
    [alert addAction:ok];
    [[self currentTopViewController] presentViewController:alert animated:YES completion:nil];
}

+ (UIViewController *)currentTopViewController
{
    UIViewController *topVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    while (topVC.presentedViewController)
    {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

@end
