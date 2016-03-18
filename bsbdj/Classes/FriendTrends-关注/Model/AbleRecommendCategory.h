//
//  AbleRecommendCategory.h
//  bsbdj
//
//  推荐关注，左边的数据模型
//
//  Created by 袁冬平 on 16/3/11.
//  Copyright © 2016年 袁冬平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AbleRecommendCategory : NSObject

/**id*/
@property (nonatomic, assign) NSInteger id;

/** 总数 */
@property (nonatomic, assign) NSInteger count;

/** 名字 */
@property (nonatomic, copy) NSString *name;


/** 这个类别对应的右边的用户数据 */
@property (nonatomic, strong) NSMutableArray *users;

/** 总数 */
@property (nonatomic, assign) NSInteger total;

/** 当前的页码 */
@property (nonatomic, assign) NSInteger currentPage;


@end
