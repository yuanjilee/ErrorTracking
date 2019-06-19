//
//  WTCrashCase.m
//  ErrorTracking_Example
//
//  Created by 安笑 on 2019/3/28.
//  Copyright © 2019 YC Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WTCrashCase.h"

@import ErrorTracking;

@implementation WTCrashCase

void aFunction()
{
}

+ (void)crash0
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [self performSelector:@selector(thisIsTheUnrecognizedSelectorCausingTheCrash)];
#pragma clang diagnostic pop
}


+ (void)crash1
{
#ifndef __clang_analyzer__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    NSArray* anArray = @[@"one",@"two",@"three"];
    NSString* myCrashingString = anArray[5];
#pragma clang diagnostic pop
#endif
}


+ (void)crash2
{
#ifndef __clang_analyzer__
    int *nullPointer = NULL;
    *nullPointer = 2017;
#endif
}


+ (void)crash3
{
    CGRect aRect = (CGRect){0.0/0.0, 0.0, 100.0, 100.0};
    UIView *crashView = UIView.new;
    crashView.frame = aRect;
}


+ (void)crash4
{
    NSString* reason = @"This is the exception!";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: @"And this is the exception's description."};
    NSException* e = [NSException exceptionWithName:NSGenericException reason:reason userInfo:userInfo];
    [e raise];
}


+ (void)crash5
{
    kill(getpid(), SIGABRT);
}


+ (void)crash6
{
    __builtin_trap();
}


+ (void)crash7
{
    NSLog(@"%@", (__bridge NSString *)(void *)100);
}


+ (void)crash8
{
#ifndef __clang_analyzer__
    NSObject*  test = NSObject.new;
    CFRelease((__bridge CFTypeRef)test);
    NSLog(@"%@", test.description);
#endif
}


+ (void)crash9
{
    int *functionPointer = (int*)aFunction;
    *functionPointer = 0;
}


+ (void)crash10
{
    [self crash10];
}


+ (void)crash11
{
    abort();
}

+ (void)crash12
{
  NSException *exception = [NSException exceptionWithName:@"Custom Exception 1" reason:@"exception reason 1" userInfo:nil];
  [ErrorTracking reportException:exception];
}

+ (void)crash13
{
    sleep(6);
}

@end
