//
//  AnimationTools.m
//  ShopCartAnimation
//
//  Created by hebing on 17/1/7.
//  Copyright © 2017年 hebing. All rights reserved.
//

#import "AnimationTools.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
@interface AnimationTools()<CAAnimationDelegate>


@property (nonatomic, strong) CALayer *layer;

@end
@implementation AnimationTools

+ (AnimationTools *)defautTools
{
    return [[AnimationTools alloc] init];
}
-(void)startAnimationandView:(UIView *)view superView:(UIView *)superView finishView:(UIView *)finishView
{
    
   
    //图层
    _layer = [CALayer layer];
    _layer.contents = view.layer.contents;//
    _layer.backgroundColor = [UIColor greenColor].CGColor;
    _layer.contentsGravity = kCAGravityResizeAspect;
    
    [superView.layer addSublayer:_layer];
    
    CGRect rect = [view.superview convertRect:view.frame toView:superView];
    _layer.bounds = rect;
    _layer.position = CGPointMake(rect.origin.x + view.frame.size.width/2, CGRectGetMidY(rect)); //a 点
    // 路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:_layer.position];
    
    CGPoint finishPoint = [finishView.superview convertPoint:finishView.frame.origin toView:superView];
    
    //确定抛物线的最高点位置  controlPoint
    [path addQuadCurveToPoint:finishPoint controlPoint:CGPointMake(ScreenWidth/2 ,rect.origin.y + 100)];
    //关键帧动画
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.path = path.CGPath;
    // pathAnimation.delegate = self;
    
    //往下抛时旋转小动画
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.removedOnCompletion = YES;
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:12];
    rotateAnimation.duration = 2.0f;
    rotateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    /**
     *   kCAMediaTimingFunctionLinear   动画从头到尾的速度是相同的
     kCAMediaTimingFunctionEaseIn   动画以低速开始。
     kCAMediaTimingFunctionEaseOut  动画以低速结束。
     kCAMediaTimingFunctionEaseInEaseOut   动画以低速开始和结束。
     kCAMediaTimingFunctionDefault
     */
    
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[pathAnimation,rotateAnimation];
    groups.duration = 1.2f;
    
    //设置之后做动画的layer不会回到一开始的位置
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    
    //让工具类成为组动画的代理
    groups.delegate = self;
    [_layer addAnimation:groups forKey:@"group"];
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //    [anim def];
    if (anim == [_layer animationForKey:@"group"]) {
        
        NSLog(@"3333333");
        [_layer removeFromSuperlayer];
        _layer = nil;
        
    }
}

@end
