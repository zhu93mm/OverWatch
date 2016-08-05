//
//  SquareViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/5.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "SquareViewController.h"

@interface SquareViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *squareTableView;
@end

@implementation SquareViewController
#pragma mark - UITableViewDelegate 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"The world need hero";
    return cell;
}

#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"广场";
        self.navigationItem.title = @"在这里停顿";
        self.tabBarItem.image = [UIImage imageNamed:@"首页-广场"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"首页-广场点击"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self squareTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (UITableView *)squareTableView {
	if(_squareTableView == nil) {
		_squareTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_squareTableView];
        _squareTableView.delegate = self;
        _squareTableView.dataSource = self;
        [_squareTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_squareTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
	}
	return _squareTableView;
}

@end
