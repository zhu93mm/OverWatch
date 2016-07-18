//
//  HerosViewCell.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/6.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "HerosViewCell.h"

@implementation HerosViewCell

- (UIView *)view {
    if(_view == nil) {
        _view = [[UIView alloc] initWithFrame:CGRectZero];
        [self.iconIV addSubview:_view];
        _view.backgroundColor = kRGBColor(12, 12, 12, 0.6);
        [_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(0);
            make.height.equalTo(20);
        }];
    }
    return _view;
}

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _iconIV;
}

- (UILabel *)heroNameLb {
    if(_heroNameLb == nil) {
        _heroNameLb = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.view addSubview:_heroNameLb];
        [_heroNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _heroNameLb.textColor = [UIColor whiteColor];
        _heroNameLb.textAlignment = NSTextAlignmentCenter;
        [_heroNameLb sizeToFit];
    }
    return _heroNameLb;
}

@end
