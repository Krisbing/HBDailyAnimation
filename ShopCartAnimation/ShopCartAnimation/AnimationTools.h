//
//  AnimationTools.h
//  ShopCartAnimation
//
//  Created by hebing on 17/1/7.
//  Copyright © 2017年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AnimationTools : NSObject

+ (AnimationTools *)defautTools;

-(void)startAnimationandView:(UIView *)view superView:(UIView *)superView finishView:(UIView *)finishView;

@end
