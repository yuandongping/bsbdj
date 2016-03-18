//
//  AbleRecommendTag.h
//  bsbdj
//
//  Created by 袁冬平 on 16/3/18.
//  Copyright © 2016年 袁冬平. All rights reserved.

//  推荐标签
//

#import <Foundation/Foundation.h>

@interface AbleRecommendTag : NSObject

/** 图片 */
@property (nonatomic, copy) NSString *image_list;

/** id */
@property (nonatomic, assign) NSInteger theme_id;

/** 名称 */
@property (nonatomic, copy) NSString *theme_name;

/** 订阅数量 */
@property (nonatomic, assign) NSInteger sub_number;


@end
