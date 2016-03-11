//
//  UIBarButtonItem+AbleExtension.m
//  budejie
//
//  Created by 袁冬平 on 16/3/8.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "UIBarButtonItem+AbleExtension.h"

@implementation UIBarButtonItem (AbleExtension)

+ (instancetype) itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

@end
