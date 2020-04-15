//
//  RRCNetLoopTools.m
//  NetLoopTime
//
//  Created by gaoguangxiao on 2020/4/15.
//  Copyright © 2020 gaoguangxiao. All rights reserved.
//

#import "RRCNetLoopTools.h"

#import "RRCNetworkTool.h"

@interface RRCNetLoopTools ()

@property (nonatomic,strong) RRCLoopTimeTools *loopTimeTool;

@end

@implementation RRCNetLoopTools

-(void)loadLoopRequestWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary * _Nonnull))success{
    
    [[RRCNetworkTool sharedTool]loadRequestWithURLString:URLString parameters:parameters success:^(NSDictionary * _Nonnull result) {
        
        //如果需要循环调用 就需要注册
        if ([self.timerFlagArray containsObject:URLString]) {
            [self initLoopTime:URLString];
        }
        
        success(result);
    }];
    
}

-(void)initLoopTime:(NSString *)timeFlag{
    NSLog(@"%@",[NSThread currentThread]);
    self.loopTimeTool.timeKey = timeFlag;//会变化
    
    [self.loopTimeTool startFireTimer];
    
    __weak typeof(self) weakSelf = self;
    self.loopTimeTool.timtCycleTargetEnd = ^(NSString * _Nonnull timeFlag) {
        
        NSLog(@"那个标志：%@",timeFlag);
        [self loopNetWorking:timeFlag];
    };
    
    //
}

-(void)loopNetWorking:(NSString *)timeFlag{
    
    if ([self.timerFlagArray containsObject:timeFlag]) {
        [[RRCNetworkTool sharedTool] loadRequestWithURLString:@"" parameters:@{} success:^(NSDictionary * _Nonnull result) {
            
            if (self.NetDataBlock) {
                self.NetDataBlock(result);
            }
        }];
    }
}

-(void)registerTimerModel:(RRCLoopTimeTools *)timerModel{
    //注册
    [self.timerFlagArray addObject:timerModel.timeKey];
    
    self.loopTimeTool = timerModel;

}

-(void)unregisterTimerFlag:(NSString *)timeFlag{
    //销毁对应
    [self.timerFlagArray removeObject:timeFlag];
    
    if (self.timerFlagArray.count == 0) {
        [self.loopTimeTool endTimer];
    }
}

-(NSMutableArray *)timerFlagArray{
    if (!_timerFlagArray) {
        _timerFlagArray = [NSMutableArray new];
    }
    return _timerFlagArray;
}

-(RRCLoopTimeTools *)loopTimeTool{
    if (!_loopTimeTool) {
        _loopTimeTool = [RRCLoopTimeTools new];
    }
    return _loopTimeTool;
}
@end
