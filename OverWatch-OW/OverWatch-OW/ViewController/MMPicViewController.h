//
//  MMPicViewController.h
//  OverWatch-OW
//
//  Created by minmin on 16/7/25.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>

@interface MMPicViewController : MWPhotoBrowser

- (instancetype)initWithAid:(NSString *)aid;
@property (nonatomic) NSString *aid;

@end
