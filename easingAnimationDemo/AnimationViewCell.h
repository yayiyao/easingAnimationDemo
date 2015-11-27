//
//  AnimationViewCell.h
//  easingAnimationDemo
//
//  Created by 谢斌 on 15/11/26.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationViewCell : UITableViewCell

@property (nonatomic, readonly) double (^easing)(double s);

+ (AnimationViewCell *)cellWithName:(NSString *)name
                             easing:(double(^)(double s))easing;

@end
