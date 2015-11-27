//
//  CAKeyframeAnimation+Tween.h
//  layerTest
//
//  Created by 谢斌 on 15/11/25.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAKeyframeAnimation (Easing)

/// 每秒钟的帧数
@property (nonatomic, assign) NSInteger framesPerSeconds;

@property (nonatomic, strong) NSValue *fromValue;
@property (nonatomic, strong) NSValue *toValue;

/// 每秒钟的帧数
@property (nonatomic, copy) double(^easing)(double s);

@end
