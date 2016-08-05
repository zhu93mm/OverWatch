//
//  MMSkillViewCell.m
//  OverWatch-OW
//
//  Created by minmin on 16/8/5.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMSkillViewCell.h"

@implementation MMSkillViewCell

- (UIImageView *)skillIV {
    if(_skillIV == nil) {
        _skillIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_skillIV];
        [_skillIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(5);
            make.left.equalTo(10);
            make.size.equalTo(CGSizeMake(30, 30));
        }];
        _skillIV.layer.cornerRadius = 15;
        _skillIV.contentMode = UIViewContentModeScaleAspectFill;
        _skillIV.clipsToBounds = YES;
        _skillIV.image = [UIImage imageNamed:@"bg-OW"];
    }
    return _skillIV;
}

- (UILabel *)skillNameLb {
    if(_skillNameLb == nil) {
        _skillNameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_skillNameLb];
        [_skillNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.skillIV.mas_top);
            make.left.equalTo(self.skillIV.mas_right).equalTo(10);
        }];
        _skillNameLb.font = [UIFont systemFontOfSize:15];
        _skillNameLb.textColor = [UIColor blueColor];
    }
    return _skillNameLb;
}

- (UILabel *)skillKeyLb {
    if(_skillKeyLb == nil) {
        _skillKeyLb = [[UILabel alloc] init];
    }
    return _skillKeyLb;
}

- (UILabel *)skillProLb {
    if(_skillProLb == nil) {
        _skillProLb = [[UILabel alloc] init];
    }
    return _skillProLb;
}

- (UILabel *)skillDesLb {
    if(_skillDesLb == nil) {
        _skillDesLb = [[UILabel alloc] init];
    }
    return _skillDesLb;
}

- (UILabel *)skillTipsLb {
    if(_skillTipsLb == nil) {
        _skillTipsLb = [[UILabel alloc] init];
    }
    return _skillTipsLb;
}

- (UIButton *)skillBtn {
    if(_skillBtn == nil) {
        _skillBtn = [[UIButton alloc] init];
    }
    return _skillBtn;
}

- (UIView *)lineView1 {
    if(_lineView1 == nil) {
        _lineView1 = [[UIView alloc] init];
    }
    return _lineView1;
}

- (UIView *)lineView2 {
    if(_lineView2 == nil) {
        _lineView2 = [[UIView alloc] init];
    }
    return _lineView2;
}

@end
