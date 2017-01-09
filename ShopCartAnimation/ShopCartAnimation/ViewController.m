//
//  ViewController.m
//  ShopCartAnimation
//
//  Created by hebing on 17/1/6.
//  Copyright © 2017年 hebing. All rights reserved.
//

#import "ViewController.h"
#import "GoodsModel.h"
#import "GoodsCell.h"
#import "AnimationTools.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate>

@property (nonatomic ,strong) UITableView *shopCartTableView;

@property (nonatomic, strong) NSMutableArray *goodsArray;

@property (nonatomic, strong) UILabel *numberLabel;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _goodsArray = [GoodsModel getGoodsData].mutableCopy;
    [self.shopCartTableView reloadData];
    [self createShopCartLabel];
}
- (UITableView *)shopCartTableView
{
    if (!_shopCartTableView) {
        
        _shopCartTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_shopCartTableView registerClass:[GoodsCell class] forCellReuseIdentifier:@"cell"];
        _shopCartTableView.delegate = self;
        _shopCartTableView.dataSource = self;
        [self.view addSubview:_shopCartTableView];
    }
    
    return _shopCartTableView;
}
- (void)createShopCartLabel
{
    _numberLabel = [UILabel new];
    _numberLabel.backgroundColor = [UIColor redColor];
    _numberLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 50, 10, 40, 40);
    _numberLabel.layer.cornerRadius = 20;
    _numberLabel.clipsToBounds = YES;
    _numberLabel.text = @"121";
    _numberLabel.textAlignment = NSTextAlignmentCenter;
    _numberLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:_numberLabel];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.goodsArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.model = self.goodsArray[indexPath.row];
    
    cell.animationBlock = ^(UIImageView *goodsView){
    
        [[AnimationTools defautTools] startAnimationandView:goodsView superView:self.view finishView:self.numberLabel];
    
    };
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
@end
