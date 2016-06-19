//
//  MasonryScrollViewController.m
//  ZJLMasonryDemo
//
//  Created by ZhongZhongzhong on 16/6/18.
//  Copyright © 2016年 ZhongZhongzhong. All rights reserved.
//

#import "MasonryScrollViewController.h"

@interface MasonryScrollViewController ()

@end

@implementation MasonryScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView *scrollview = [UIScrollView new];
    scrollview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollview];
    [scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(self.view);
    }];
    
    UIView *container = [UIView new];
    [scrollview addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(scrollview);
        make.edges.equalTo(scrollview);
        
    }];
    
    int count = 10;
    
    UIView *lastView = nil;
    
    for ( int i = 1 ; i <= count ; ++i )
    {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if ( lastView )
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        
        lastView = subv;
    }
    
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
