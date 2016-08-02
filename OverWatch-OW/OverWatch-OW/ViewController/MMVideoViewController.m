//
//  MMVideoViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/25.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMVideoViewController.h"
#import "MMNetManager.h"

@import MediaPlayer;

@interface MMVideoViewController ()
@property (nonatomic) MMVideoModel *videoMadel;

@end

@implementation MMVideoViewController
#pragma mark - LifeCycle 生命周期
- (instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20);
        make.left.right.equalTo(0);
        make.height.equalTo(btn.mas_width).multipliedBy(175 / 320.0);
    }];
    
    /* MPMoviePlayerViewController在9.0中被移除了
    [btn bk_addEventHandler:^(id sender) {
        NSURL *videoURL = [NSURL URLWithString:self.videoMadel.content.firstObject.video];
        MPMoviePlayerViewController *videoVC = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
        [self presentViewController:videoVC animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
     */
    
    [self.view showBusyHUD];
    [MMNetManager getVideoWithAid:self.aid completionHandler:^(MMVideoModel *model, NSError *error) {
        self.videoMadel = model;
        [btn setBackgroundImageWithURL:[NSURL URLWithString:model.litpic] forState:UIControlStateNormal placeholder:[UIImage imageNamed:@"bg-OW"]];
        [self.view hideBusyHUD];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MMVideoModel *)videoMadel {
	if(_videoMadel == nil) {
		_videoMadel = [[MMVideoModel alloc] init];
	}
	return _videoMadel;
}

@end
