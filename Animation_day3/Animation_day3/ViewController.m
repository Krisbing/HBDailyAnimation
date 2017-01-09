//
//  ViewController.m
//  Animation_day3
//
//  Created by hebing on 17/1/9.
//  Copyright © 2017年 hebing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *inputField;

@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.view addSubview:self.inputField];
    [self.view addSubview:self.button];
}
- (UITextField *)inputField
{
    if (!_inputField) {
        
        _inputField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        _inputField.center = self.view.center;
        _inputField.layer.borderWidth = 2.0f;
        _inputField.layer.borderColor = [UIColor grayColor].CGColor;
        _inputField.layer.cornerRadius = 10.0f;
        
    }
    
    return _inputField;
}
- (UIButton *)button
{
    if (!_button) {
        
        _button = [UIButton new];
        _button.frame = CGRectMake(CGRectGetMinX(_inputField.frame), CGRectGetMaxY(_inputField.frame) + 20, CGRectGetWidth(_inputField.frame), CGRectGetHeight(_inputField.frame));
        [_button setTitle:@"登录" forState:UIControlStateNormal];
        _button.backgroundColor = [UIColor orangeColor];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(shakeAnimation) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
- (void)shakeAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    animation.additive = YES;
    [_inputField.layer addAnimation:animation forKey:@"shake"];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
