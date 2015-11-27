//
//  AnimationViewCell.m
//  easingAnimationDemo
//
//  Created by 谢斌 on 15/11/26.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import "AnimationViewCell.h"
#import "EasingCurveView.h"

@interface AnimationViewCell ()

@property (nonatomic, assign) IBOutlet UILabel *nameLabel;

@property (nonatomic, assign) IBOutlet EasingCurveView * curveView;

//@property (nonatomic, assign) IBOutlet UIView *animateView;

@end

@implementation AnimationViewCell

+ (AnimationViewCell *)cellWithName:(NSString *)name easing:(double (^)(double))easing
{
    AnimationViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"AnimationViewCell"
                                                             owner:nil
                                                           options:nil] objectAtIndex:0];
    
    cell.nameLabel.text = name;
    cell.curveView.easing = easing;
    
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (double (^)(double))easing
{
    return self.curveView.easing;
}

@end
