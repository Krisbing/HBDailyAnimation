//
//  GoodsCell.m
//  ShopCartAnimation
//
//  Created by hebing on 17/1/6.
//  Copyright © 2017年 hebing. All rights reserved.
//

#import "GoodsCell.h"
@interface GoodsCell()

@property (nonatomic, strong) UIImageView *goodsImageView;

@property (nonatomic, strong) UIButton *addButton;

@property (nonatomic, strong) UILabel *numberLabel;

@end
@implementation GoodsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.addButton addTarget:self action:@selector(addToShopCart:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}
- (void)setModel:(GoodsModel *)model
{
    _model = model;
    self.goodsImageView.image = [UIImage imageNamed:@"test"];
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",_model.goodsNumber];
}
- (UIImageView *)goodsImageView
{
    if (!_goodsImageView) {
        
        _goodsImageView = [UIImageView new];
        _goodsImageView.contentMode = UIViewContentModeScaleAspectFit;
        _goodsImageView.frame = CGRectMake(10, 10, 60, 60);
        [self addSubview:_goodsImageView];
    }
    
    return _goodsImageView;
}
- (UIButton *)addButton
{
    if (!_addButton) {
        
        _addButton = [UIButton new];
        _addButton.frame = CGRectMake(200, 25, 100, 30);
        [_addButton setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _addButton.backgroundColor = [UIColor yellowColor];
        [self addSubview:_addButton];
    }
    
    return _addButton;
}
- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        
        _numberLabel = [UILabel new];
        _numberLabel.textColor = [UIColor blackColor];
        _numberLabel.font = [UIFont systemFontOfSize:14];
        _numberLabel.frame = CGRectMake(140, 20, 50, 30);
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_numberLabel];
    }
    
    return _numberLabel;
}
- (void)addToShopCart:(UIButton *)sender
{
    self.model.goodsNumber++;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",_model.goodsNumber];
    
    if (self.animationBlock) {
        
        self.animationBlock(self.goodsImageView);
    }
}

@end
