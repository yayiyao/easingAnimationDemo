//
//  CAKeyframeAnimation+Tween.m
//  layerTest
//
//  Created by 谢斌 on 15/11/25.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import "CAKeyframeAnimation+Easing.h"
#import "Tween.h"
#import <objc/runtime.h>

static const char keyFramePerSeconds;
static const char keyFromeValue;
static const char keyToValue;
static const char keyEasing;

@implementation CAKeyframeAnimation (Easing)

- (void)setFramesPerSeconds:(NSInteger)framesPerSeconds
{
    objc_setAssociatedObject(self, &keyFramePerSeconds, @(framesPerSeconds), OBJC_ASSOCIATION_RETAIN);
    
    [self rebuildValuesIfCan];
}

- (NSInteger)framesPerSeconds
{
    return [objc_getAssociatedObject(self, &keyFramePerSeconds) integerValue];
}

- (void)setFromValue:(NSValue *)fromValue
{
    objc_setAssociatedObject(self, &keyFromeValue, fromValue, OBJC_ASSOCIATION_RETAIN);
    
    [self rebuildValuesIfCan];
}

- (NSValue *)fromValue
{
    return objc_getAssociatedObject(self, &keyFromeValue);
}

- (void)setToValue:(NSValue *)toValue
{
    objc_setAssociatedObject(self, &keyToValue, toValue, OBJC_ASSOCIATION_RETAIN);
    
    [self rebuildValuesIfCan];
}

- (NSValue *)toValue
{
    return objc_getAssociatedObject(self, &keyToValue);
}

- (void)setEasing:(double (^)(double))easing
{
    objc_setAssociatedObject(self, &keyEasing, easing, OBJC_ASSOCIATION_COPY);
    
    [self rebuildValuesIfCan];
}

- (double (^)(double))easing
{
    return objc_getAssociatedObject(self, &keyEasing);
}

- (void)rebuildValuesIfCan
{
    if (!self.fromValue || !self.toValue || !self.easing || !self.duration) {
        return;
    }
    
    if (0 == self.framesPerSeconds) {
        self.framesPerSeconds = 60;
    }
    
    NSMutableArray *values = [NSMutableArray array];
    
    TweenFunction tween = Tween(self.fromValue, self.toValue);
    NSInteger totalFrames = self.framesPerSeconds * self.duration;
    for (NSInteger i = 1; i <= totalFrames; ++i) {
        NSValue *value = tween(self.easing(i * 1.0 / totalFrames));
        [values addObject:value];
    }
    
    self.values = [NSArray arrayWithArray:values];
}

@end
