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

@protocol ErrorTrackingDelegate <NSObject>

@optional

/**
 发生异常时回调

 @param exception 异常信息
 @return 返回需上报记录，随异常上报一起上报
 */
- (NSString *)attachmentForException:(NSException *)exception;

@end

@interface ErrorTracking: NSObject

/**
 初始化ErrorTracking,使用默认ErrorTrackingConfig

 @param appKey 注册ErrorTracking分配的应用唯一标识
 */
+ (void)installWithAppKey:(NSString *)appKey;

/**
 使用指定配置初始化ErrorTracking

 @param appKey 注册ErrorTracking分配的应用唯一标识
 @param config 传入配置的 ErrorTrackingConfig
 */
+ (void)installWithAppKey:(NSString *)appKey
                  config:(ErrorTrackingConfig *)config;

/**
 设置关键数据，随崩溃信息上报

 @param key 长度小于50,且以字母或下划线开头
 @param value 值
 */
+ (void)setUserInfoWithKey:(nonnull NSString *)key
                     value:(NSString *)value;

/**
 设置标签

 @param key 键
 @param value 值
 */
+ (void)setTagWithKey:(nonnull NSString *)key
                     value:(NSString *)value;

/**
 获取关键数据

 @return 关键数据
 */
+ (NSArray *)allUserValues;

/**
 上报自定义Objective-C异常

 @param exception 异常信息
 */
+ (void)reportException:(nullable NSException *)exception;

/**
 上报自定义Objective-C异常

 @param exception 异常信息
 @param fingerprint 标记同一个异常
 */
+ (void)reportException:(nullable NSException *)exception
            fingerprint:(NSString *)fingerprint;

/**
 ErrorTracking Delegate
 */
@property (nonatomic, assign) id<ErrorTrackingDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
