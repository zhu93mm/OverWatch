//
//  MMRecomViewModel.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/12.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMRecomViewModel.h"
#import <Foundation/NSException.h>

@implementation MMRecomViewModel

- (instancetype)initWithType:(RecomType *)recomType{
    if (self = [super init]) {
        _type = recomType;
    }
    return self;
}

- (instancetype)init{
    NSAssert(NO, @"%s,必须使用initWithType:方法初始化", __FUNCTION__);
    return nil;
}

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 0;
    switch (requestMode) {
        case RequestModeRefresh: {
            tmpPage = 0;
            break;
        }
        case RequestModeMore: {
            tmpPage = _page + 11;
            break;
        }
    }
    
    self.dataTask = [MMNetManager getRecommend:_type start:tmpPage completionHandler:^(MMRecommendModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            self.indexpicList = model.data.indexpic;
            [self.dataList addObjectsFromArray:model.data.list];
            _page = tmpPage;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

- (MMRecommendDataIndexpicModel *)indexpicListForRow:(NSInteger)row{
    return self.indexpicList[row];
}

- (MMRecommendDataListModel *)dataListForRow:(NSInteger)row{
    return self.dataList[row];
}

- (NSString *)titleIndexForRow:(NSInteger)row{
    return [self indexpicListForRow:row].longtitle;
}

- (NSURL *)picURLIndexForRow:(NSInteger)row{
    NSString *picPath = [self indexpicListForRow:row].litpic;
    return [NSURL URLWithString:picPath];
}

- (CellType)cellType:(NSInteger)row{
    NSString *type = [self dataListForRow:row].type;
    if ([type isEqualToString:@"all"]) {
        return all;
    }else if ([type isEqualToString:@"pic"]) {
        return pic;
    }else {
        return video;
    }
}

- (NSURL *)picURLForRow:(NSInteger)row{
    NSString *picPath = [self dataListForRow:row].litpic;
    return [NSURL URLWithString:picPath];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self dataListForRow:row].longtitle;
}

- (NSString *)contentForRow:(NSInteger)row{
    return [self dataListForRow:row].desc;
}

- (NSString *)numberForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%@人浏览", [self dataListForRow:row].click];
}

- (NSArray<MMRecommendDataIndexpicModel *> *)indexpicList {
    if(_indexpicList == nil) {
        _indexpicList = [[NSArray<MMRecommendDataIndexpicModel *> alloc] init];
    }
    return _indexpicList;
}

- (NSMutableArray<MMRecommendDataListModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<MMRecommendDataListModel *> alloc] init];
    }
    return _dataList;
}
@end
