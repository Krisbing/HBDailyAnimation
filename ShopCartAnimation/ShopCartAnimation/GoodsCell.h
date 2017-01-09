//
//  GoodsCell.h
//  ShopCartAnimation
//
//  Created by hebing on 17/1/6.
//  Copyright © 2017年 hebing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
@interface GoodsCell : UITableViewCell

@property (nonatomic, strong) GoodsModel *model;

@property (nonatomic, copy) void(^animationBlock)(UIImageView *goodsView);

@end
