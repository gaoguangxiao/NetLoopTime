//
//  RRCNetworkTool.h
//  NetLoopTime
//
//  Created by gaoguangxiao on 2020/4/15.
//  Copyright © 2020 gaoguangxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRCNetworkTool : NSObject

+ (instancetype)sharedTool;

- (void)loadRequestWithURLString: (NSString *)URLString
                      parameters: (NSDictionary *)parameters
                         success:(void (^)(NSDictionary *result))success;
@end

NS_ASSUME_NONNULL_END
