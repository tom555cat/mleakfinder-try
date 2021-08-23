//
//  MLeaksMessenger.h
//  MLeaksFinder
//
//  Created by 佘泽坡 on 7/17/16.
//  Copyright © 2016 zeposhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern BOOL MLeaksFinder_ShouldShowAlertView;

@interface MLeaksMessenger : NSObject

+ (BOOL)shouldAlert;
+ (void)alertWithTitle:(NSString *_Nullable)title message:(NSString *)message handler:(void (^ __nullable)(UIAlertAction *action))handler;

@end
