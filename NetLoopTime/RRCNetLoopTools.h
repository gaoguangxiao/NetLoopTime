//
//  RRCNetLoopTools.h
//  NetLoopTime
//
//  Created by gaoguangxiao on 2020/4/15.
//  Copyright © 2020 gaoguangxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RRCLoopTimeTools.h"
NS_ASSUME_NONNULL_BEGIN

@interface RRCNetLoopTools : NSObject

@property (nonatomic, strong) NSMutableArray *timerFlagArray;

@property (nonatomic, strong)void(^NetDataBlock)(NSDictionary *netData);

-(void)loadLoopRequestWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary * _Nonnull))success;

-(void)registerTimerModel:(RRCLoopTimeTools *)timerModel;

-(void)unregisterTimerFlag:(NSString *)timeFlag;

@end

NS_ASSUME_NONNULL_END
