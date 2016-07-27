//
//  MMPicViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/25.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMPicViewController.h"
#import "MMNetManager.h"

@interface MMPicViewController ()<MWPhotoBrowserDelegate>

@property (nonatomic) MMPicModel *picModel;

@end

@implementation MMPicViewController
#pragma mark - MWPhotoBrowserDelegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.picModel.content.count;
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    return [MWPhoto photoWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", self.picModel.content[index].pic]]];
}

#pragma mark - LifeCycle 生命周期
- (instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    [self.view showBusyHUD];
    [MMNetManager getPicWithAid:_aid completionHandler:^(MMPicModel *model, NSError *error) {
        [self.view hideBusyHUD];
        self.picModel = model;
        [self reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MMPicModel *)picModel {
	if(_picModel == nil) {
		_picModel = [[MMPicModel alloc] init];
	}
	return _picModel;
}

@end
