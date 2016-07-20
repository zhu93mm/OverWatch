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

@interface MMRecomViewModel : MMBaseViewModel

- (instancetype)initWithType:(RecomType *)recomType;

@property (nonatomic) NSInteger page;
@property (nonatomic) RecomType *type;

@property (nonatomic, strong) NSArray<MMRecommendDataIndexpicModel *> *indexpicList;
@property (nonatomic, strong) NSMutableArray<MMRecommendDataListModel *> *dataList;
- (MMRecommendDataIndexpicModel *)indexpicListForRow:(NSInteger)row;
- (MMRecommendDataListModel *)dataListForRow:(NSInteger)row;

- (NSString *)titleForRow:(NSInteger)row;

@end
