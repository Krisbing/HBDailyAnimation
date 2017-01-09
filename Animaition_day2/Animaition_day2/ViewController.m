//
//  ViewController.m
//  Animaition_day2
//
//  Created by hebing on 17/1/9.
//  Copyright © 2017年 hebing. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"
@interface ViewController ()

@property (nonatomic ,strong) AnimationView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.animationView];

}
- (AnimationView *)animationView
{
    if (!_animationView) {
        
        _animationView = [[AnimationView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
        
    }
    
    return _animationView;
}
@end
