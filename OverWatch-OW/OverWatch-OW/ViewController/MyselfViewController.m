//
//  MyselfViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/5.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MyselfViewController.h"
#import "MMLoginViewController.h"
//#import "MMLoginLViewController.h"

@interface MyselfViewController ()
@property (nonatomic) UIImageView *animationIV;
@property (nonatomic) UILabel *titleL;
@property (nonatomic) UIButton *loginBtn;
@end

@implementation MyselfViewController

- (instancetype)init{
    if (self = [super init]) {
        /*为myselfVC添加故事板
        self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
        */
        self.title = @"我";
        self.navigationItem.title = @"I am hero";
        self.tabBarItem.image = [UIImage imageNamed:@"首页-个人"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"首页-个人点击"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(0);
        make.size.equalTo(CGSizeMake(50, 50));
    }];
    [btn setTitle:@"button" forState:UIControlStateNormal];
    [btn setTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
     */
    self.view.backgroundColor = kRGBColor(243, 221, 132, 1.0);
    [self animationIV];
    [self titleL];
    [self loginBtn];
     
}

#pragma mark - Methods 
- (void)loginBtnClicked:(id)sender{
    MMLoginViewController *loginVC = [[MMLoginViewController alloc] init];
    //修改返回按钮的文字
    UIBarButtonItem *cancleBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = cancleBtn;
    [self.navigationController pushViewController:loginVC animated:YES];
}

/* 用于button的跳转
- (void)clickButton:(id)sender{
    MMLoginLViewController *loginVC = [[MMLoginLViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (UIImageView *)animationIV {
	if(_animationIV == nil) {
		_animationIV = [[UIImageView alloc] init];
        [self.view addSubview:_animationIV];
        [_animationIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view.mas_centerY).equalTo(-50);
            make.centerX.equalTo(0);
            make.size.equalTo(CGSizeMake(144, 143));
        }];
        _animationIV.image = [UIImage animatedImageNamed:@"loading_" duration:0.4];
	}
	return _animationIV;
}

- (UILabel *)titleL {
	if(_titleL == nil) {
		_titleL = [[UILabel alloc] init];
        [self.view addSubview:_titleL];
        [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.animationIV.mas_bottom).equalTo(5);
            make.centerX.equalTo(0);
        }];
        _titleL.font = [UIFont systemFontOfSize:17];
        _titleL.text = @"你还没有登录哦!";
	}
	return _titleL;
}

- (UIButton *)loginBtn {
	if(_loginBtn == nil) {
		_loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.view addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleL.mas_bottom).equalTo(5);
            make.centerX.equalTo(0);
            make.size.equalTo(CGSizeMake(60, 35));
        }];
        [_loginBtn setTarget:self action:@selector(loginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:kRGBColor(177, 209, 67, 0.8)];
        _loginBtn.layer.cornerRadius = 5;
	}
	return _loginBtn;
}

@end
