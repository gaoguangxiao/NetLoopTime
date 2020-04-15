//
//  RRCNetworkTool.m
//  NetLoopTime
//
//  Created by gaoguangxiao on 2020/4/15.
//  Copyright © 2020 gaoguangxiao. All rights reserved.
//

#import "RRCNetworkTool.h"

@implementation RRCNetworkTool



+ (instancetype)sharedTool {
    static RRCNetworkTool * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

-(void)loadRequestWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary * _Nonnull))success{
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        sleep(2.0);
//        dispatch_sync(dispatch_get_main_queue(), ^{
            success(@{});
//        });
//    });
}


@end
