//
//  MMVideoModel.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMVideoModel.h"

@implementation MMVideoModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"content": [MMVideoContentModel class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName": @"typename",
             @"desc": @"description"};
}

@end
//@implementation Esarray
//
//@end


@implementation MMVideoContentModel

@end


//@implementation Relevant
//
//@end

