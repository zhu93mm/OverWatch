//
//  MMDetailViewController.h
//  OverWatch-OW
//
//  Created by minmin on 16/7/25.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMDetailViewController : UIViewController

- (instancetype)initWithURL:(NSURL *)url;
@property (nonatomic) NSURL *url;

@end
