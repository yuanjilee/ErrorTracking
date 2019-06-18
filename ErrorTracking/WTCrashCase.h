//
//  WTCrashCase.h
//  Catchfly_Example
//
//  Created by 安笑 on 2019/3/28.
//  Copyright © 2019 YC Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTCrashCase : NSObject

+ (void)crash0;     // Unrecognized Selector
+ (void)crash1;     // Out of Bounds
+ (void)crash2;     // NULL Pointer
+ (void)crash3;     // Invalid Geometry
+ (void)crash4;     // Raise Custom Exception
+ (void)crash5;     // kill
+ (void)crash6;     // __builtin_trap
+ (void)crash7;     // Access to a Non-Object
+ (void)crash8;     // Message a Released Object
+ (void)crash9;     // Write to Read-Only Memory
+ (void)crash10;    // Stack Overflow
+ (void)crash11;    // abort
+ (void)crash12;    // Custom Crash Log
+ (void)crash13;

@end

NS_ASSUME_NONNULL_END
