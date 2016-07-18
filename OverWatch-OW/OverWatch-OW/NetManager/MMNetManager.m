//
//  MMNetManager.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/12.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMNetManager.h"

@implementation MMNetManager

+ (id)getRecommend:(RecomType *)recomType start:(NSInteger)startIndex completionHandler:(void (^)(MMRecommendModel *, NSError *))compleHandler{
    
    return [self GET:@"http://cache.tuwan.com/app/?appid=1&classmore=indexpic&appid=1&appver=2.1" parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !compleHandler ?: compleHandler([MMRecommendModel parseJSON:jsonObject], error);
    }];
}

@end
