//
//  MMPicModel.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/25.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMPicModel.h"

@implementation MMPicModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"relevant": [MMPicRelevantModel class],
             @"content": [MMPicContentModel class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName": @"typename",
             @"desc": @"description"};
}

@end
//@implementation Esarray
//
//@end


//@implementation Infochild
//
//@end
//
//
//@implementation Showitem
//
//@end
//
//
//@implementation Info
//
//@end


@implementation MMPicRelevantModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName": @"typename",
             @"desc": @"description"};
}

@end

@implementation MMPicContentModel

@end


//@implementation Info
//
//@end


