//
//  AbleEssenceViewController.m
//  budejie
//
//  精选
//
//  Created by 袁冬平 on 16/3/7.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleEssenceViewController.h"
#import "AbleRecommendTagsViewController.h"

@interface AbleEssenceViewController ()

@end

@implementation AbleEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航栏内容
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    //设置背景色
    self.view.backgroundColor = AbleGlobaBg;
    
//    已经在自定义NavigationController中处理
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    AbleLogFunc;
}

- (void)tagClick
{
//    AbleLog(@"点击，精选的导航栏左边按钮");
//    AbleLog(@"%s", __func__);
//    AbleLogFunc;
    
    AbleRecommendTagsViewController *vc = [[AbleRecommendTagsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
