//
//  MMRecommendCell.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/16.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMRecommendCell.h"

@implementation MMRecommendCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self iconIV];
        
        self.separatorInset = UIEdgeInsetsZero;
        self.layoutMargins = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(110, 80));
            make.left.top.equalTo(10);
            make.bottom.equalTo(-10);
        }];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        _iconIV.image = [UIImage imageNamed:@"iconIV_BG"];
    }
    return _iconIV;
}

//- (UILabel *)titleL {
//    if(_titleL == nil) {
//        _titleL = [[UILabel alloc] init];
//        [self.contentView addSubview:_titleL];
////        [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.left.equalTo(self.iconIV.mas_right).equalTo(10);
////            make.top.equalTo(10);
////            
////        }];
//        _titleL.font = [UIFont systemFontOfSize:15];
//        [_titleL sizeToFit];
//        _titleL.text = @"the world need heros";
//    }
//    return _titleL;
//}
//
//- (UILabel *)contentL {
//    if(_contentL == nil) {
//        _contentL = [[UILabel alloc] init];
//        [self.contentView addSubview:_contentL];
////        [_contentL mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.left.equalTo(self.titleL);
////            make.top.equalTo(self.titleL.mas_bottom).equalTo(10);
////        }];
//        _titleL.font = [UIFont systemFontOfSize:12];
//        [_titleL sizeToFit];
//        _titleL.text = @"we need heros";
//    }
//    return _contentL;
//}
//
//- (UILabel *)numL {
//    if(_numL == nil) {
//        _numL = [[UILabel alloc] init];
//        [self.contentView addSubview:_numL];
//        [_numL mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.bottom.equalTo(-5);
//        }];
//        _titleL.font = [UIFont systemFontOfSize:6];
//        [_titleL sizeToFit];
//        _titleL.text = @"1000人浏览";
//    }
//    return _numL;
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
