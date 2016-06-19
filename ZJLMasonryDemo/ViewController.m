//
//  ViewController.m
//  ZJLMasonryDemo
//
//  Created by ZhongZhongzhong on 16/6/18.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor redColor];
    [view1 addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view1).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    UIView *view3 = [UIView new];
    view3.backgroundColor = [UIColor orangeColor];
    [view2 addSubview:view3];
    
    UIView *view4 = [UIView new];
    view4.backgroundColor = [UIColor orangeColor];
    [view2 addSubview:view4];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view2.mas_centerY);
        make.left.equalTo(view2.mas_left).with.offset(10);
        make.right.equalTo(view4.mas_left).with.offset(-10);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view4);
    }];
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view2.mas_centerY);
        make.left.equalTo(view3.mas_right).with.offset(10);
        make.right.equalTo(view2.mas_right).with.offset(-10);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view3);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
