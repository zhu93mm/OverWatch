//
//  MMRecommendModel.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/12.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMRecommendModel.h"

@implementation MMRecommendModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[MMRecommendDataModel class]};
}

@end

@implementation MMRecommendDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"indexpic":[MMRecommendDataIndexpicModel class], @"list":[MMRecommendDataListModel class]};
}

@end

@implementation MMRecommendDataIndexpicModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName":@"typename", @"desc":@"description"};
}

@end


@implementation MMRecommendDataListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName":@"typename", @"desc":@"description"};
}

@end


