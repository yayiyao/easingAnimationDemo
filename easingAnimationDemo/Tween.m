//
//  Tween.m
//  layerTest
//
//  Created by 谢斌 on 15/11/26.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import "Tween.h"
#import <UIKit/UIKit.h>

TweenFunction TweenCGRect(CGRect from, CGRect to)
{
    CGFloat deltaX = to.origin.x - from.origin.x;
    CGFloat deltaY = to.origin.y - from.origin.y;
    CGFloat deltaW = to.size.width - from.size.width;
    CGFloat delatH = to.size.height - from.size.height;
    
    return ^id (double s) {
        CGRect rect = {{
            from.origin.x + s * deltaX,
            from.origin.y + s * deltaY
        }, {
            from.size.width + deltaW * s,
            from.size.height + delatH * s
        }};
        
        return [NSValue valueWithCGRect:rect];
    };
}

TweenFunction TweenCGSize(CGSize from, CGSize to)
{
    CGFloat deltaW = to.width - from.width;
    CGFloat delatH = to.height - from.height;
    
    return ^id (double s) {
        CGSize size = {
            from.width + deltaW * s,
            from.height + delatH * s
        };
        return [NSValue valueWithCGSize:size];
    };
}

TweenFunction TweenCGPoint(CGPoint from, CGPoint to)
{
    CGFloat deltaX = to.x - from.x;
    CGFloat deltaY = to.y - from.y;
    
    return ^id (double s) {
        CGPoint point = {
            from.x + s * deltaX,
            from.y + s * deltaY
        };
        return [NSValue valueWithCGPoint:point];
    };
}

TweenFunction TweenDouble(double from, double to)
{
    double delta = to - from;
    
    return ^id (double s) {
        return @(from + s * delta);
    };
}

TweenFunction Tween(id fromValue, id toValue)
{
    assert([fromValue class] == [toValue class]);
    if ([fromValue isKindOfClass:[NSNumber class]]) {
        // NSNumber
        return TweenDouble([fromValue doubleValue], [toValue doubleValue]);
    }
    
    if ([fromValue isKindOfClass:[NSValue class]]) {
        const char *fromObjcType = [fromValue objCType];
        const char *toObjcType = [toValue objCType];
        assert(strcmp(fromObjcType, toObjcType) == 0);
        
        if (strcmp(fromObjcType, @encode(CGRect)) == 0) {
            // NSValue with CGRect
            return TweenCGRect([fromValue CGRectValue], [toValue CGRectValue]);
        }
        if (strcmp(fromObjcType, @encode(CGSize)) == 0) {
            // NSValue with CGSize
            return TweenCGSize([fromValue CGSizeValue], [toValue CGSizeValue]);
        }
        if (strcmp(fromObjcType, @encode(CGPoint)) == 0) {
            // NSValue with CGPoint
            return TweenCGPoint([fromValue CGPointValue], [toValue CGPointValue]);
        }
    }
    
    // TODO: other values
    assert(false);
}
