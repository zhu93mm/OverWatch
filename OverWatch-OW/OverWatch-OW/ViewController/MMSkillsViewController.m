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
    return cell;
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
            make.edges.equalTo(0);
        }];
        _skillsTableView.delegate = self;
        _skillsTableView.dataSource = self;
        [_skillsTableView registerClass:[MMSkillViewCell class] forCellReuseIdentifier:@"Cell"];
	}
	return _skillsTableView;
}

@end
