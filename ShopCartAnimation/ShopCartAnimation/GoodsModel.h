//
//  GoodsModel.h
//  ShopCartAnimation
//
//  Created by hebing on 17/1/6.
//  Copyright © 2017年 hebing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

+ (NSArray *)getGoodsData;

@property (nonatomic ,copy) NSString *goodsName;

@property (nonatomic, assign) NSInteger goodsNumber;

@end
