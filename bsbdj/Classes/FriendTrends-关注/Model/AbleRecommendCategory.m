//
//  AbleRecommendCategory.m
//  bsbdj
//
//  Created by 袁冬平 on 16/3/11.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import "AbleRecommendCategory.h"

@implementation AbleRecommendCategory

- (NSMutableArray *)users
{
    if(!_users){
        _users = [NSMutableArray array];
    }
    return  _users;
}
@end
