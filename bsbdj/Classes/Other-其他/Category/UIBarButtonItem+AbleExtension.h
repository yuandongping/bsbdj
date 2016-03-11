//
//  UIBarButtonItem+AbleExtension.h
//  budejie
//
//  Created by 袁冬平 on 16/3/8.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (AbleExtension)
+ (instancetype) itemWithImage:(NSString *)image highImage:(NSString *) highImage target:(id)target action:(SEL)action;
@end
