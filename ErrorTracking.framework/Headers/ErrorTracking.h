//
//  ErrorTracking.h
//  ErrorTracking
//
//  Copyright © 2019 YC Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WTLog.h"
#import "ErrorTrackingConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface ErrorTracking: NSObject

/**
 初始化Catchfly,使用默认CatchflyConfig

 @param appID 注册Catchfly分配的应用唯一标识
 */
+ (void)installWithAppID:(NSString *)appID;

/**
 使用指定配置初始化Catchfly

 @param appID 注册Catchfly分配的应用唯一标识
 @param config 传入配置的 ErrorTrackingConfig
 */
+ (void)installWithAppID:(NSString *)appID
                  config:(ErrorTrackingConfig *)config;


/**
 设置关键数据，随崩溃信息上报

 @param key 长度小于50,且以字母或下划线开头
 @param name 用户ID
 @param value 值
 */
+ (void)setUserInfoWithKey:(nonnull NSString *)key
                     value:(NSString *)value
                      name:(NSString *)name;

/**
 上报自定义Objective-C异常

 @param exception 异常信息
 */
+ (void)reportException:(nullable NSException *)exception;


/**
 上报自定义Objective-C异常

 @param exception 异常信息
 @param fingetPrint 标记同一个异常
 */
+ (void)reportException:(nullable NSException *)exception
            fingerPrint:(NSString *)fingetPrint;


@end

NS_ASSUME_NONNULL_END
