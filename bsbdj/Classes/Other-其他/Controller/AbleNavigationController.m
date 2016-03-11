//
//  AbleNavigationController.m
//  bsbdj
//
//  自定义导航控制器
//
//  Created by 袁冬平 on 16/3/10.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleNavigationController.h"

@implementation AbleNavigationController

/**
 *当第一次使用这个类的时候会调用一次
 */
+ (void) initialize
{
//    UINavigationBar *bar = [UINavigationBar appearance];
    //当导航栏用在AbleNavigationController中，appearance才会生效
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:[self class], nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    AbleLogFunc;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
//    self.navigationBar.tintColor = [UIColor redColor];//返回按钮的颜色
    
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
//    AbleLogFunc;
}

/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    [super pushViewController:viewController animated:animated];
    
//    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"好好" style:UIBarButtonItemStyleDone target:nil action:nil];

    if(self.childViewControllers.count > 0){//如果push进来的不是第一个控制器
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        button.size = CGSizeMake(100, 30);
//        [button sizeToFit];
        //让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        button.backgroundColor = [UIColor greenColor];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    //要放在最后的位置
    [super pushViewController:viewController animated:animated];
}
         
- (void)back{
    AbleLogFunc;
    [self popViewControllerAnimated:YES];
}

@end


