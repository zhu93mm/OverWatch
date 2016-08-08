//
//  MMSkillViewCell.m
//  OverWatch-OW
//
//  Created by minmin on 16/8/5.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMSkillViewCell.h"
#define kSkillColor [UIColor blueColor]
#define kLineColor kRGBColor(220, 220, 220, 1.0)
#define kTextSize 15

@implementation MMSkillViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self skillNameLb];
        [self skillKeyLb];
        [self skillProLb];
        self.separatorInset = UIEdgeInsetsZero;
        self.layoutMargins = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}

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
            make.height.equalTo(kTextSize);
        }];
        _skillNameLb.font = [UIFont systemFontOfSize:kTextSize];
        _skillNameLb.textColor = kSkillColor;
    }
    return _skillNameLb;
}

- (UILabel *)skillKeyLb {
    if(_skillKeyLb == nil) {
        _skillKeyLb = [[UILabel alloc] init];
        [self.contentView addSubview:_skillKeyLb];
        [_skillKeyLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lineView1.mas_bottom).equalTo(3);
            make.left.equalTo(self.lineView1.mas_left);
            make.width.equalTo(50);
            make.height.equalTo(kTextSize);
            make.bottom.equalTo(-50);
        }];
        _skillKeyLb.font = [UIFont systemFontOfSize:kTextSize];
        _skillKeyLb.backgroundColor = kSkillColor;
        _skillKeyLb.textColor = [UIColor whiteColor];
        _skillKeyLb.textAlignment = NSTextAlignmentCenter;
//        _skillKeyLb.layer.cornerRadius = 2;
    }
    return _skillKeyLb;
}

- (UILabel *)skillProLb {
    if(_skillProLb == nil) {
        _skillProLb = [[UILabel alloc] init];
        [self.contentView addSubview:_skillProLb];
        [_skillProLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.skillKeyLb.mas_centerY);
            make.left.equalTo(self.skillKeyLb.mas_right).equalTo(3);
            make.height.equalTo(kTextSize);
        }];
        _skillProLb.font = [UIFont systemFontOfSize:kTextSize];
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
        [self.contentView addSubview:_lineView1];
        [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.skillIV.mas_right).equalTo(10);
            make.top.equalTo(self.skillNameLb.mas_bottom).equalTo(3);
            make.right.equalTo(-10);
            make.height.equalTo(1);
        }];
        _lineView1.backgroundColor = kLineColor;
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
