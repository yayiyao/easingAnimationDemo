//
//  AnimationViewController.m
//  easingAnimationDemo
//
//  Created by 谢斌 on 15/11/26.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import "AnimationViewController.h"
#import "EasingCurveView.h"
#import "CAKeyframeAnimation+Easing.h"

@interface AnimationViewController ()

@property (nonatomic, assign) IBOutlet EasingCurveView *curveView;

@property (nonatomic, assign) IBOutlet UIView *animationView;

@property (nonatomic, assign) IBOutlet UIButton *buttonStart;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.curveView.easing = self.easing;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startAnimation
{
    self.buttonStart.enabled = NO;
    
    CGPoint from = self.animationView.layer.position;
    CGPoint to = {
        from.x,
        from.y + 100
    };
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:from];
    animation.toValue = [NSValue valueWithCGPoint:to];
    animation.duration = 0.7;
    animation.fillMode = kCAFillModeForwards;
    animation.easing = self.easing;
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    [self.animationView.layer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.buttonStart.enabled = YES;
}

- (IBAction)startButtonDidClicked:(id)sender
{
    [self startAnimation];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
