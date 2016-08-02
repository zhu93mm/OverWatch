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
    return [self GET:[NSString stringWithFormat:kShouWangPath, startIndex] parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !compleHandler ?: compleHandler([MMRecommendModel parseJSON:jsonObject], error);
    }];
}

+ (id)getPicWithAid:(NSString *)aid completionHandler:(void (^)(MMPicModel *, NSError *))completionHandler{
    return [self GET:[NSString stringWithFormat:@"http://api.tuwan.com/app/?aid=%@&appid=1", aid] parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        NSArray *tmpArr = [MMPicModel parseJSON:jsonObject];
        !completionHandler ?: completionHandler(tmpArr.firstObject, error);
    }];
}

+ (id)getVideoWithAid:(NSString *)aid completionHandler:(void (^)(MMVideoModel *, NSError *))completionHandler{
    return [self GET:[NSString stringWithFormat:@"http://api.tuwan.com/app/?aid=%@&appid=1", aid] parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        NSArray *tmpArr = [MMVideoModel parseJSON:jsonObject];
        !completionHandler ?: completionHandler(tmpArr.firstObject, error);
    }];
}

@end
