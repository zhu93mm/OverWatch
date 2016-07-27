//
//  MMNetManager.h
//  OverWatch-OW
//
//  Created by minmin on 16/7/12.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMRecommendModel.h"
#import "MMPicModel.h"
#import "MMVideoModel.h"

typedef NS_ENUM(NSUInteger, RecomType) {
    RecomTypeZuiXin,
    RecomTypeZiXun,
};

@interface MMNetManager : NSObject

+ (id)getRecommend:(RecomType *)recomType start:(NSInteger)startIndex completionHandler:(void(^)(MMRecommendModel *model, NSError *error))compleHandler;

+ (id)getPicWithAid:(NSString *)aid completionHandler:(void(^)(MMPicModel *model, NSError *error))completionHandler;

+ (id)getVideoWithAid:(NSString *)aid completionHandler:(void(^)(MMVideoModel *model, NSError *error))completionHandler;

@end
