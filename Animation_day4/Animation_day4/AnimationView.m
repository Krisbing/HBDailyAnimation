//
//  AnimationView.m
//  Animation_day4
//
//  Created by hebing on 17/1/9.
//  Copyright © 2017年 hebing. All rights reserved.
//

#import "AnimationView.h"
@interface AnimationView()

@property (nonatomic, strong) CAShapeLayer *circleLayer;

@property (nonatomic, strong) CAShapeLayer *satelliteLayer;


@end
@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        self.backgroundColor = [UIColor whiteColor];

        [self.layer addSublayer:self.circleLayer];
        [self.layer addSublayer:self.satelliteLayer];
        
        //[self startAnimation];
    }
    
    return self;
}
- (CAShapeLayer *)circleLayer
{
    if (!_circleLayer) {
        
        _circleLayer = [CAShapeLayer layer];
        _circleLayer.fillColor = [UIColor yellowColor].CGColor;
        _circleLayer.strokeColor = [UIColor clearColor].CGColor;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:80 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        _circleLayer.path = path.CGPath;
    }
    
    return _circleLayer;
}
- (CAShapeLayer *)satelliteLayer
{
    if (!_satelliteLayer) {
        
        _satelliteLayer = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-20,-20, 260, 260)];
        _satelliteLayer.path = path.CGPath;
        _satelliteLayer.fillColor = [UIColor clearColor].CGColor;
        _satelliteLayer.strokeColor = [UIColor greenColor].CGColor;
//        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(-90, -90) radius:20 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
//        _satelliteLayer.path = path.CGPath;
        _satelliteLayer.frame = CGRectMake(100, 100, 40, 40);
        //_satelliteLayer.position = self.center;
        //_satelliteLayer.backgroundColor = [UIColor redColor].CGColor;
        //_satelliteLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"28"].CGImage);
        NSLog(@"position=== %@",NSStringFromCGPoint(_satelliteLayer.position));
    }
    
    return _satelliteLayer;
}
- (void)startAnimation
{
    NSLog(@"position=== %@",NSStringFromCGPoint(_satelliteLayer.position));
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-30,-30, 240, 240)];
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = path.CGPath;
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [_satelliteLayer addAnimation:orbit forKey:@"orbit"];
}
@end
