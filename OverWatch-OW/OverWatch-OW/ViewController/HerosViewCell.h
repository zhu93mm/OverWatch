//
//  HerosViewCell.h
//  OverWatch-OW
//
//  Created by minmin on 16/7/6.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HerosViewCell : UICollectionViewCell

/** 标签条 */
@property (nonatomic, strong) UIView *view;
/** 英雄头像图片 */
@property (nonatomic, strong) UIImageView *iconIV;
/** 英雄名标签 */
@property (nonatomic, strong) UILabel *heroNameLb;

@end
