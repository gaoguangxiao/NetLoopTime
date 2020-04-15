//
//  RRCDiscolorModel.h
//  NetLoopTime
//
//  Created by gaoguangxiao on 2020/4/15.
//  Copyright © 2020 gaoguangxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRCDiscolorModel : NSObject

@property (nonatomic, strong) UIColor *color;//显示颜色
@property (nonatomic, strong) NSString *value;//数值
@property (nonatomic, assign) CGFloat flag;//升降状态

@end

NS_ASSUME_NONNULL_END
