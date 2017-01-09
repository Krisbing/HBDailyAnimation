//
//  AnimationView.m
//  Animaition_day2
//
//  Created by hebing on 17/1/9.
//  Copyright © 2017年 hebing. All rights reserved.
//

#import "AnimationView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface AnimationView()

@property (nonatomic ,strong) CAShapeLayer *firstLayer;

@property (nonatomic ,strong) CAShapeLayer *secondLayer;


@end
@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor orangeColor];
        
        [self.layer addSublayer:self.firstLayer];
        [self.layer addSublayer:self.secondLayer];
        
        [self stratAnimation];
    }
    
    return self;
}
- (CAShapeLayer *)firstLayer
{
    if (!_firstLayer) {
        
        _firstLayer = [CAShapeLayer layer];
        _firstLayer.lineWidth = 2.0f;
        _firstLayer.strokeColor = [UIColor blueColor].CGColor;
        _firstLayer.fillColor = [UIColor clearColor].CGColor;
        
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 100)];
        [path addCurveToPoint:CGPointMake(ScreenWidth, 100) controlPoint1:CGPointMake(ScreenWidth/4, 150) controlPoint2:CGPointMake(ScreenWidth/4 * 3, 50)];
        _firstLayer.path = path.CGPath;
    }
    
    return _firstLayer;
}
- (CAShapeLayer *)secondLayer
{
    if (!_secondLayer) {
        
        _secondLayer = [CAShapeLayer layer];
        _secondLayer.lineWidth = 2.0f;
        _secondLayer.strokeColor = [UIColor greenColor].CGColor;
        _secondLayer.fillColor = [UIColor clearColor].CGColor;
        
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 100)];
        [path addCurveToPoint:CGPointMake(ScreenWidth, 100) controlPoint1:CGPointMake(ScreenWidth/4, 50) controlPoint2:CGPointMake(ScreenWidth/4 * 3, 150)];
        _secondLayer.path = path.CGPath;
    }
    
    return _secondLayer;
}
- (void)stratAnimation
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 100)];
    [path addCurveToPoint:CGPointMake(ScreenWidth, 100) controlPoint1:CGPointMake(ScreenWidth/4, 50) controlPoint2:CGPointMake(ScreenWidth/4 * 3, 150)];
    
    CABasicAnimation *firstAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    firstAnimation.toValue = (__bridge id _Nullable)(path.CGPath);
    firstAnimation.removedOnCompletion = NO;
    firstAnimation.fillMode = kCAFillModeForwards;
    firstAnimation.duration = 2.0f;
    firstAnimation.repeatCount = 1;
    [_firstLayer addAnimation:firstAnimation forKey:nil];
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(0, 100)];
    [path1 addCurveToPoint:CGPointMake(ScreenWidth, 100) controlPoint1:CGPointMake(ScreenWidth/4, 150) controlPoint2:CGPointMake(ScreenWidth/4 * 3, 50)];
    
    CABasicAnimation *secondAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    secondAnimation.toValue = (__bridge id _Nullable)(path1.CGPath);
    secondAnimation.removedOnCompletion = NO;
    secondAnimation.fillMode = kCAFillModeForwards;
    secondAnimation.duration = 2.0f;
    secondAnimation.repeatCount = 1;
    [_secondLayer addAnimation:secondAnimation forKey:nil];
    
    
    
    [self performSelector:@selector(nextAnimation) withObject:nil afterDelay:2.0f];
}
- (void)nextAnimation
{
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(0, 100)];
    [path1 addCurveToPoint:CGPointMake(ScreenWidth, 100) controlPoint1:CGPointMake(ScreenWidth/4, 150) controlPoint2:CGPointMake(ScreenWidth/4 * 3, 50)];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 100)];
    [path addCurveToPoint:CGPointMake(ScreenWidth, 100) controlPoint1:CGPointMake(ScreenWidth/4, 50) controlPoint2:CGPointMake(ScreenWidth/4 * 3, 150)];
    
    CABasicAnimation *firstAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    firstAnimation.toValue = (__bridge id _Nullable)(path1.CGPath);
    firstAnimation.removedOnCompletion = NO;
    firstAnimation.fillMode = kCAFillModeForwards;
    firstAnimation.duration = 2.0f;
    firstAnimation.repeatCount = 1;
    [_firstLayer addAnimation:firstAnimation forKey:nil];
    
    CABasicAnimation *secondAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    secondAnimation.toValue = (__bridge id _Nullable)(path.CGPath);
    secondAnimation.removedOnCompletion = NO;
    secondAnimation.fillMode = kCAFillModeForwards;
    secondAnimation.duration = 2.0f;
    secondAnimation.repeatCount = 1;
    [_secondLayer addAnimation:secondAnimation forKey:nil];
    
    [self performSelector:@selector(stratAnimation) withObject:nil afterDelay:2.0f];
}
@end
