//
//  MMRecomViewModel.h
//  OverWatch-OW
//
//  Created by minmin on 16/7/12.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMBaseViewModel.h"
#import "MMNetManager.h"

typedef NS_ENUM(NSUInteger, CellType) {
    all,
    pic,
    video
};

@interface MMRecomViewModel : MMBaseViewModel

- (instancetype)initWithType:(RecomType *)recomType;

@property (nonatomic) NSInteger page;
@property (nonatomic) RecomType *type;

@property (nonatomic, strong) NSArray<MMRecommendDataIndexpicModel *> *indexpicList;
@property (nonatomic, strong) NSMutableArray<MMRecommendDataListModel *> *dataList;
- (MMRecommendDataIndexpicModel *)indexpicListForRow:(NSInteger)row;
- (MMRecommendDataListModel *)dataListForRow:(NSInteger)row;

/* 头部滚动视图 */
- (NSString *)titleIndexForRow:(NSInteger)row;
- (NSURL *)picURLIndexForRow:(NSInteger)row;

/* 资讯Cell相关 */
- (CellType)cellType:(NSInteger)row; //Cell的类型(网页/图片/视频)
- (NSURL *)picURLForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row withIndex:(NSInteger)index;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)contentForRow:(NSInteger)row;
- (NSString *)numberForRow:(NSInteger)row;
- (NSURL *)viewForRow:(NSInteger)row;
- (NSString *)aidForRow:(NSInteger)row;

@end
