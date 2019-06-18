//
//  ErrorTrackingConfig.h
//  ErrorTracking
//
//  Copyright © 2019 YC Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WTLog.h"

NS_ASSUME_NONNULL_BEGIN

@interface ErrorTrackingConfig : NSObject

@property(nonatomic, assign) WTLogLevel logLevel;
@property(nonatomic, assign) BOOL trackStep;

@end

NS_ASSUME_NONNULL_END
