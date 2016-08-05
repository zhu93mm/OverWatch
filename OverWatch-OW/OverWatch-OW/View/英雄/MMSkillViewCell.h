//
//  MMSkillViewCell.h
//  OverWatch-OW
//
//  Created by minmin on 16/8/5.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMSkillViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *skillIV;
@property (nonatomic, strong) UILabel *skillNameLb;
@property (nonatomic, strong) UILabel *skillKeyLb;
@property (nonatomic, strong) UILabel *skillProLb;
@property (nonatomic, strong) UILabel *skillDesLb;
@property (nonatomic, strong) UILabel *skillTipsLb;
@property (nonatomic, strong) UIButton *skillBtn;
//分隔线
@property (nonatomic, strong) UIView *lineView1;
@property (nonatomic, strong) UIView *lineView2;

@end
