//
//  RRCLoopTimeTools.m
//  NetLoopTime
//
//  Created by gaoguangxiao on 2020/4/15.
//  Copyright © 2020 gaoguangxiao. All rights reserved.
//

#import "RRCLoopTimeTools.h"

@interface RRCLoopTimeTools ()

@property (nonatomic, strong) NSTimer *loopTimer;
@end

@implementation RRCLoopTimeTools

-(instancetype)init{
    if (self) {
        self.timeKey = @"com.timer.app";
        self.timeSize = 1;
        self.timeCount = 0;
        self.timeBegin = [NSDate date];
        self.timeCycle = 6;
        
    }
    return self;
}

-(void)startFireTimer{
    [[NSRunLoop currentRunLoop]addTimer:self.loopTimer forMode:NSRunLoopCommonModes];
    
    [self.loopTimer fire];
}

-(void)endTimer{
    
    if (_loopTimer) {
        [_loopTimer invalidate];
        _loopTimer = nil;
    }
}

-(void)timerStartAdd:(NSTimer *)timer{
    
    self.timeCount = self.timeCount + self.timeSize;
    NSLog(@"%f--计时--",self.timeCount);
    if (self.timeCount - self.timeCycle == 0) {
        
        self.timeCount = 0;
        
        self.timeCountCycle ++;
        
        if (self.timtCycleTargetEnd) {
            self.timtCycleTargetEnd(self.timeKey);
        }
    }
}

-(NSTimer *)loopTimer{
    if (!_loopTimer) {
        _loopTimer = [NSTimer timerWithTimeInterval:self.timeSize target:self selector:@selector(timerStartAdd:) userInfo:nil repeats:YES];
    }
    return _loopTimer;
}
@end
