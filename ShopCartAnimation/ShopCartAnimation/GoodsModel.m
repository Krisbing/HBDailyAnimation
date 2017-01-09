//
//  GoodsModel.m
//  ShopCartAnimation
//
//  Created by hebing on 17/1/6.
//  Copyright © 2017年 hebing. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel

+ (NSArray *)getGoodsData
{
    NSMutableArray *muArray = [NSMutableArray new];
    for (int i = 0; i < 20; i++) {
        
        GoodsModel *model = [[self alloc] init];
        model.goodsName = @"测试测试";
        model.goodsNumber = i;
        [muArray addObject:model];
    }
    
    return muArray;
}

@end
