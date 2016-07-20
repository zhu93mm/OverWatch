//
//  MMPicRecommendCell.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/18.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMPicRecommendCell.h"
#define kInterval ([UIScreen mainScreen].bounds.size.width - 3 * 110 - 2 * 10)/2

@implementation MMPicRecommendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self numL];
        [self iconIV3];
        self.separatorInset = UIEdgeInsetsZero;
        self.layoutMargins = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}

- (UILabel *)titleL{
    if (_titleL == nil) {
        _titleL = [[UILabel alloc] init];
        [self.contentView addSubview:_titleL];
        [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(5);
        }];
        _titleL.font = [UIFont systemFontOfSize:18];
        [_titleL sizeToFit];
        _titleL.text = @"pectures of hero";
    }
    return _titleL;
}

- (UILabel *)numL {
    if(_numL == nil) {
        _numL = [[UILabel alloc] init];
        [self.contentView addSubview:_numL];
        [_numL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleL.mas_centerY);
            make.right.equalTo(-10);
        }];
        _numL.font = [UIFont systemFontOfSize:10];
        [_numL sizeToFit];
        _numL.text = @"1000人浏览";
    }
    return _numL;
}

- (UIImageView *)iconIV1 {
    if(_iconIV1 == nil) {
        _iconIV1 = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV1];
        [_iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.titleL.mas_bottom).equalTo(5);
            make.size.equalTo(CGSizeMake(110, 80));
            make.bottom.equalTo(-5);
        }];
        _iconIV1.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV1.clipsToBounds = YES;
        _iconIV1.image = [UIImage imageNamed:@"OW-bg"];
    }
    return _iconIV1;
}

- (UIImageView *)iconIV2 {
    if(_iconIV2 == nil) {
        _iconIV2 = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV2];
        [_iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV1.mas_top);
            make.left.equalTo(self.iconIV1.mas_right).equalTo(kInterval);
            make.size.equalTo(CGSizeMake(110, 80));
        }];
        _iconIV2.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV2.clipsToBounds = YES;
        _iconIV2.image = [UIImage imageNamed:@"OW-bg"];
    }
    return _iconIV2;
}

- (UIImageView *)iconIV3 {
    if(_iconIV3 == nil) {
        _iconIV3 = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV3];
        [_iconIV3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV2.mas_top);
            make.left.equalTo(self.iconIV2.mas_right).equalTo(kInterval);
            make.size.equalTo(CGSizeMake(110, 80));
        }];
        _iconIV3.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV3.clipsToBounds = YES;
        _iconIV3.image = [UIImage imageNamed:@"OW-bg"];
    }
    return _iconIV3;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
