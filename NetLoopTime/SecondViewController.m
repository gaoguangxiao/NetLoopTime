//
//  SecondViewController.m
//  NetLoopTime
//
//  Created by gaoguangxiao on 2020/4/15.
//  Copyright © 2020 gaoguangxiao. All rights reserved.
//

#import "SecondViewController.h"
#import "RRCDiscolorModel.h"

#import "RRCNetLoopTools.h"
@interface SecondViewController ()
{
    UIView *colorView;
    UIView *colorView2;
    UIView *colorView3;
}
//@property (nonatomic,strong) RRCNetLoopTools *loopTimeTool;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //2秒变一次
    colorView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    colorView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:colorView];
    
    //4秒变一次
    colorView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 160, self.view.frame.size.width, 50)];
    colorView2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:colorView2];
    
    //6秒变一次
    colorView3 = [[UIView alloc]initWithFrame:CGRectMake(0, 220, self.view.frame.size.width, 50)];
    colorView3.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:colorView3];
    
    
    [self initLoopTime:@"GGX" andCycle:1.5];//2
    
//    [self initLoopTime:@"QQQ" andCycle:3];//4
    
//    [self initLoopTime:@"WWW" andCycle:4];//6
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    //    [self.loopTimeTool unregisterTimerFlag:@"GGX"];
}
-(void)initLoopTime:(NSString *)netName andCycle:(CGFloat)cycle{
    
    RRCNetLoopTools *loopTimeTool = [RRCNetLoopTools new];
    
    RRCLoopTimeTools *toolsa = [RRCLoopTimeTools new];
    toolsa.timeCycle = cycle;
    toolsa.timeSize = 0.5;
    toolsa.timeKey = netName;
    [loopTimeTool registerTimerModel:toolsa];
    
    [loopTimeTool loadLoopRequestWithURLString:netName parameters:@{} success:^(NSDictionary * _Nonnull a) {
        //第一次的数据
        NSArray *array = @[[UIColor redColor],[UIColor blackColor],[UIColor greenColor]];
        
        RRCDiscolorModel *discolorModel = [RRCDiscolorModel new];
        discolorModel.color = array[arc4random() %2];
    }];
    
    loopTimeTool.NetDataBlock = ^(NSDictionary * _Nonnull netData) {
        NSArray *array = @[[UIColor redColor],[UIColor blackColor],[UIColor greenColor]];
        RRCDiscolorModel *discolorModel = [RRCDiscolorModel new];
        discolorModel.color = array[arc4random() %2];
        if (toolsa.timeCycle == 2) {
            self->colorView.backgroundColor = discolorModel.color;
        }else if (toolsa.timeCycle == 4){
            self->colorView2.backgroundColor = discolorModel.color;
        }else{
            self->colorView3.backgroundColor = discolorModel.color;
        }
  
    };
}

-(void)dealloc{
    NSLog(@"%@--dealloc--",self.class);
    
}

@end
