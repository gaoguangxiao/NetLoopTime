//
//  RRCLoopTimeTools.h
//  NetLoopTime
//
//  Created by gaoguangxiao on 2020/4/15.
//  Copyright © 2020 gaoguangxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface RRCLoopTimeTools : NSObject

@property (nonatomic, strong) NSDate *timeBegin;//创建此队列时间
@property (nonatomic, strong) NSString *timeKey;//时间标志

@property (nonatomic, assign) float timeSize;//时间跳跃大小 默认1秒
@property (nonatomic, assign) float timeCount;//时间计数 自增 +timeSize
@property (nonatomic, assign) CGFloat timeCycle;//时间周期 默认6秒

@property (nonatomic, assign) NSInteger timeCountCycle;//时间周期运行

//周期性时间达到
@property (nonatomic, strong)void(^timtCycleTargetEnd)(NSString *timeFlag);


/// 开始
-(void)startFireTimer;

//结束
-(void)endTimer;
@end

NS_ASSUME_NONNULL_END
