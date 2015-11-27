//
//  EasingCurveView.m
//  easingAnimationDemo
//
//  Created by 谢斌 on 15/11/26.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import "EasingCurveView.h"

@implementation EasingCurveView

- (void)setEasing:(double (^)(double))easing
{
    _easing = [easing copy];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect inRect = CGRectInset(self.bounds, 10, self.bounds.size.height / 3);
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(c, CGRectGetMinX(inRect), CGRectGetMinY(inRect));
    CGContextAddLineToPoint(c, CGRectGetMaxX(inRect), CGRectGetMinY(inRect));
    
    CGContextMoveToPoint(c, CGRectGetMinX(inRect), CGRectGetMaxY(inRect));
    CGContextAddLineToPoint(c, CGRectGetMaxX(inRect), CGRectGetMaxY(inRect));
    
    CGContextSetRGBStrokeColor(c, 0.6, 0.6, 0.6, 1);
    CGContextStrokePath(c);
    
    NSMutableArray *points = [NSMutableArray array];
    
    CGFloat step = 1;
    CGFloat xFrom = CGRectGetMinX(inRect);
    CGFloat xTo = CGRectGetMaxX(inRect);
    CGFloat yFrom = CGRectGetMaxY(inRect);
    CGFloat yTo = CGRectGetMinY(inRect);
    for (CGFloat x = xFrom; x < xTo; x += step) {
        double s = self.easing((x - xFrom) / (xTo - xFrom));
        CGFloat y = yFrom + s * (yTo - yFrom);
        [points addObject:[NSValue valueWithCGPoint:(CGPoint){
            x, y
        }]];
    }
    // last point
    double s = self.easing(1);
    CGFloat y = yFrom + s * (yTo - yFrom);
    [points addObject:[NSValue valueWithCGPoint:(CGPoint){
        xTo, y
    }]];
    
    CGContextBeginPath(c);
    
    BOOL firstPoint = YES;
    for (NSValue *point in points) {
        CGPoint p = [point CGPointValue];
        if (firstPoint) {
            CGContextMoveToPoint(c, p.x, p.y);
            firstPoint = NO;
        } else {
            CGContextAddLineToPoint(c, p.x, p.y);
        }
    }
    
    CGContextSetRGBStrokeColor(c, 1, 0.6, 0, 1);
    CGContextSetLineWidth(c, 2);
    CGContextStrokePath(c);
}

@end
