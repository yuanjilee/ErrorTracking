//
//  WTLog.h
//  ErrorTracking
//
//  Copyright © 2019 YC Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, WTLogLevel){
    WTLogLevelSilent      = 0,
    WTLogLevelVerbose     = 1 << 0,
    WTLogLevelDebug       = 1 << 1,
    WTLogLevelInfo        = 1 << 2,
    WTLogLevelWarn        = 1 << 3,
    WTLogLevelError       = 1 << 4,
};

#define WTLOG_VERBOSE(fmt, ...)  \
    [WTLog logLevel:WTLogLevelVerbose format:fmt, ##__VA_ARGS__]

#define WTLOG_DEBUG(fmt, ...)  \
    [WTLog logLevel:WTLogLevelDebug format:fmt, ##__VA_ARGS__]

#define WTLOG_INFO(fmt, ...)  \
    [WTLog logLevel:WTLogLevelInfo format:fmt, ##__VA_ARGS__]

#define WTLOG_WARN(fmt, ...)  \
    [WTLog logLevel:WTLogLevelWarn format:fmt, ##__VA_ARGS__]

#define WTLOG_ERROR(fmt, ...)  \
    [WTLog logLevel:WTLogLevelError format:fmt, ##__VA_ARGS__]

@interface WTLog : NSObject

+ (void)logLevel:(WTLogLevel)level format:(NSString *)format, ... NS_FORMAT_FUNCTION(2, 3);

@end

NS_ASSUME_NONNULL_END
