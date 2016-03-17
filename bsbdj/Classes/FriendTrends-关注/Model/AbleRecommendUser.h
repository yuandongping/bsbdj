//
//  AbleRecommendUser.h
//  bsbdj
//
//  Created by 袁冬平 on 16/3/16.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbleRecommendUser : NSObject

/** 头像 */
@property (nonatomic, copy) NSString *header;

/** 粉丝数（有多少人关注这个用户） */
@property (nonatomic, assign) NSInteger fans_count;

/** 昵称 */
@property (nonatomic, copy) NSString *screen_name;

@end
