//
//  EasingCurveView.h
//  easingAnimationDemo
//
//  Created by 谢斌 on 15/11/26.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EasingCurveView : UIView

@property (nonatomic, copy) double (^easing)(double s);

@end
