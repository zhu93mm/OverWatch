//
//  MMSkillsViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/8/5.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMSkillsViewController.h"
#import "MMSkillViewCell.h"

@interface MMSkillsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) NSString *name;
@property (nonatomic, strong) UIImageView *iconIV;
@property (nonatomic, strong) UITableView *skillsTableView;

@end

@implementation MMSkillsViewController
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MMSkillViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.skillNameLb.text = @"hero";
    cell.skillKeyLb.text = @"左键";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"Cell" configuration:^(MMSkillViewCell *cell) {
    }];
}

#pragma mark - LifeCycle 生命周期
- (instancetype)initWithName:(NSString *)name{
    if (self = [super init]) {
        _name = name;
        self.hidesBottomBarWhenPushed = YES;
        self.navigationItem.title = _name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self skillsTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (UITableView *)skillsTableView {
	if(_skillsTableView == nil) {
		_skillsTableView = [[UITableView alloc] init];
        [self.view addSubview:_skillsTableView];
        [_skillsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV.mas_bottom).equalTo(-50);
            make.left.right.bottom.equalTo(0);
        }];
        _skillsTableView.delegate = self;
        _skillsTableView.dataSource = self;
        [_skillsTableView registerClass:[MMSkillViewCell class] forCellReuseIdentifier:@"Cell"];
	}
	return _skillsTableView;
}

- (UIImageView *)iconIV {
	if(_iconIV == nil) {
		_iconIV = [[UIImageView alloc] init];
        [self.view addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(64);
            make.left.right.equalTo(0);
            make.height.equalTo(150);
        }];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        _iconIV.image = [UIImage imageNamed:@"bg-OW"];
	}
	return _iconIV;
}

@end
