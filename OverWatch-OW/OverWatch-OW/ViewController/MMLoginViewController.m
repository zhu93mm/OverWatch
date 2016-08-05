//
//  MMLoginViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/28.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMLoginViewController.h"
#import "MMRegisterViewController.h"
#define kLineColor kRGBColor(220, 220, 220, 1.0)
#define kLineLength 15
#define kLineHeight 1

@interface MMLoginViewController ()
@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *pwdName;

@property (nonatomic) UIImageView *iconIV;
@property (nonatomic) UITextField *userTF;
@property (nonatomic) UITextField *pwdTF;
@property (nonatomic) UIButton *loginBtn;
//------- 其他登入方式 --------
@property (nonatomic) UILabel *otherLb;
@property (nonatomic) UIView *lineViewL;
@property (nonatomic) UIView *lineViewR;

@end

@implementation MMLoginViewController
#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
        self.navigationItem.title = @"登录";
        /* 去掉返回的箭头
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, 0, 44, 44);
        UIBarButtonItem *cancle = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = cancle;
         */
        
        //添加注册按钮
        UIBarButtonItem *registerBtn = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registerBtnClicked:)];
        self.navigationItem.rightBarButtonItem = registerBtn;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBGColor;
    [self loginBtn];
    [self lineViewL];
    [self lineViewR];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (UIImageView *)iconIV {
	if(_iconIV == nil) {
		_iconIV = [[UIImageView alloc] init];
        [self.view addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(100);
            make.size.equalTo(CGSizeMake(50, 50));
        }];
        [_iconIV setImage:[UIImage imageNamed:@"bg-OW"]];
        _iconIV.layer.cornerRadius = 25;
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
	}
	return _iconIV;
}

- (UITextField *)userTF {
	if(_userTF == nil) {
		_userTF = [[UITextField alloc] init];
        [self.view addSubview:_userTF];
        [_userTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV.mas_bottom).equalTo(20);
            make.left.right.equalTo(0);
            make.height.equalTo(35);
        }];
        _userTF.layer.borderWidth = 1;
        _userTF.layer.borderColor = [kRGBColor(239, 239, 239, 1.0) CGColor];
        //添加图片
        UIView *userView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        UIImageView *userIV = [[UIImageView alloc] initWithFrame:CGRectMake(7.5, 7.5, 15, 15)];
        userIV.image = [UIImage imageNamed:@"登录_用户名"];
        [userView addSubview:userIV];
        _userTF.leftView = userView;
        _userTF.leftViewMode = UITextFieldViewModeAlways;
        _userTF.placeholder = @"请输入手机号";
        _userTF.returnKeyType = UIReturnKeyGo;
        _userTF.clearButtonMode = UITextFieldViewModeWhileEditing;
	}
	return _userTF;
}

- (UITextField *)pwdTF {
	if(_pwdTF == nil) {
		_pwdTF = [[UITextField alloc] init];
        [self.view addSubview:_pwdTF];
        [_pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userTF.mas_bottom);
            make.left.right.equalTo(0);
            make.height.equalTo(35);
        }];
        _pwdTF.layer.borderWidth = 1;
        _pwdTF.layer.borderColor = [kRGBColor(239, 239, 239, 1.0) CGColor];
        //添加图片
        UIView *pwdView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        UIImageView *pwdIV = [[UIImageView alloc] initWithFrame:CGRectMake(7.5, 7.5, 15, 15)];
        pwdIV.image = [UIImage imageNamed:@"登录_密码"];
        [pwdView addSubview:pwdIV];
        _pwdTF.leftView = pwdView;
        _pwdTF.leftViewMode = UITextFieldViewModeAlways;
        _pwdTF.placeholder = @"请输入密码";
        _pwdTF.secureTextEntry = YES;
        _pwdTF.returnKeyType = UIReturnKeyGo;
        _pwdTF.clearButtonMode = UITextFieldViewModeWhileEditing;
	}
	return _pwdTF;
}

- (UIButton *)loginBtn {
	if(_loginBtn == nil) {
		_loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.view addSubview:_loginBtn];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pwdTF.mas_bottom).equalTo(20);
            make.centerX.equalTo(0);
            make.width.equalTo(300);
            make.height.equalTo(45);
        }];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:kRGBColor(86, 215, 42, 0.8)];
        _loginBtn.layer.cornerRadius = 10;
        [_loginBtn bk_addEventHandler:^(id sender) {
            [self loginBtnClicked];
        } forControlEvents:UIControlEventTouchUpInside];
	}
	return _loginBtn;
}

- (UILabel *)otherLb {
    if(_otherLb == nil) {
        _otherLb = [[UILabel alloc] init];
        [self.view addSubview:_otherLb];
        [_otherLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-100);
            make.centerX.equalTo(0);
        }];
        _otherLb.text = @"其他登录方式";
        _otherLb.font = [UIFont systemFontOfSize:12];
        _otherLb.textColor = kRGBColor(150, 150, 150, 1.0);
    }
    return _otherLb;
}

- (UIView *)lineViewL {
	if(_lineViewL == nil) {
		_lineViewL = [[UIView alloc] init];
        [self.view addSubview:_lineViewL];
        [_lineViewL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.otherLb.mas_centerY).equalTo(0);
            make.left.equalTo(kLineLength);
            make.right.equalTo(self.otherLb.mas_left).equalTo(-kLineLength);
            make.height.equalTo(kLineHeight);
        }];
        _lineViewL.backgroundColor = kLineColor;
	}
	return _lineViewL;
}

- (UIView *)lineViewR {
	if(_lineViewR == nil) {
		_lineViewR = [[UIView alloc] init];
        [self.view addSubview:_lineViewR];
        [_lineViewR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.otherLb.mas_centerY).equalTo(0);
            make.left.equalTo(self.otherLb.mas_right).equalTo(kLineLength);
            make.right.equalTo(-kLineLength);
            make.height.equalTo(kLineHeight);
        }];
        _lineViewR.backgroundColor = kLineColor;
	}
	return _lineViewR;
}

#pragma mark - Methods 
- (void)loginBtnClicked{
    //获取用户名及密码
    _userName = self.userTF.text;
    _pwdName = self.pwdTF.text;
    if ([_userName isEqualToString:@"18268209706"] && [_pwdName isEqualToString:@"minmin"]) {
        [self.view showWarning:@"登录成功"];
    }else{
        [self.view showWarning:@"用户名或密码错误"];
    }
}

- (void)registerBtnClicked:sender{
    MMRegisterViewController *registerVC = [[MMRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

@end
