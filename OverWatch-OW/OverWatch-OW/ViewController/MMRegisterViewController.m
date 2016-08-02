//
//  MMRegisterViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/8/1.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMRegisterViewController.h"
#import <SMS_SDK/SMSSDK.h>
#define kValidationBtnWidth 100

@interface MMRegisterViewController ()
//输入用户名
@property (nonatomic, strong) UITextField *userNameTF;
//输入手机号
@property (nonatomic, strong) UITextField *validationTF;
//获取验证码
@property (nonatomic, strong) UIButton *validationBtn;
//输入验证码
@property (nonatomic, strong) UITextField *inputValidationTF;
//确认验证码
@property (nonatomic, strong) UIButton *inputValidationBtn;
//输入密码
@property (nonatomic, strong) UITextField *userPwdTF;
//确认密码
@property (nonatomic, strong) UITextField *confirmPwdTF;

@end

@implementation MMRegisterViewController
#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.navigationItem.title = @"注册";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBGColor;
    [self userNameTF];
    [self validationTF];
    [self inputValidationTF];
    [self confirmPwdTF];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (UITextField *)userNameTF {
	if(_userNameTF == nil) {
		_userNameTF = [[UITextField alloc] init];
        [self.view addSubview:_userNameTF];
        [_userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(84);
            make.left.right.equalTo(0);
            make.height.equalTo(35);
        }];
        _userNameTF.layer.borderWidth = 1;
        _userNameTF.layer.borderColor = [kRGBColor(239, 239, 239, 1.0) CGColor];
        //添加图片
        UIView *userView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        UIImageView *userIV = [[UIImageView alloc] initWithFrame:CGRectMake(7.5, 7.5, 15, 15)];
        userIV.image = [UIImage imageNamed:@"登录_用户名"];
        [userView addSubview:userIV];
        _userNameTF.leftView = userView;
        _userNameTF.leftViewMode = UITextFieldViewModeAlways;
        _userNameTF.placeholder = @"请输入用户名";
        _userNameTF.returnKeyType = UIReturnKeyGo;
        _userNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
	}
	return _userNameTF;
}

- (UITextField *)validationTF {
	if(_validationTF == nil) {
		_validationTF = [[UITextField alloc] init];
        [self.view addSubview:_validationTF];
        [_validationTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userNameTF.mas_bottom).equalTo(20);
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.height.equalTo(35);
        }];
        _validationTF.layer.borderWidth = 1;
        _validationTF.layer.borderColor = [kRGBColor(239, 239, 239, 1.0) CGColor];
        _validationTF.placeholder = @"请输入手机号";
        _validationTF.returnKeyType = UIReturnKeyGo;
        
        //"手机号"提示语
        UIView *validationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 58+7.5, 35)];
        UILabel *phoneNumber = [[UILabel alloc] initWithFrame:CGRectMake(7.5, 0, 58, 35)];
        phoneNumber.text = @"手机号";
        [validationView addSubview:phoneNumber];
        _validationTF.leftView = validationView;
        _validationTF.leftViewMode = UITextFieldViewModeAlways;
        //添加获取验证码按钮
        UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kValidationBtnWidth+10, 35)];
        [btnView addSubview:self.validationBtn];
        _validationTF.rightView = btnView;
        _validationTF.rightViewMode = UITextFieldViewModeAlways;
	}
	return _validationTF;
}

- (UIButton *)validationBtn {
    if(_validationBtn == nil) {
        _validationBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _validationBtn.frame = CGRectMake(0, 0, kValidationBtnWidth, 35);
        [_validationBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_validationBtn setBackgroundColor:kRGBColor(86, 215, 42, 0.8)];
        _validationBtn.layer.cornerRadius = 10;
        [_validationBtn bk_addEventHandler:^(id sender) {
            [self validationBtnClicked];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _validationBtn;
}

- (UITextField *)inputValidationTF {
    if(_inputValidationTF == nil) {
        _inputValidationTF = [[UITextField alloc] init];
        [self.view addSubview:_inputValidationTF];
        [_inputValidationTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.validationTF.mas_bottom).equalTo(10);
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.height.equalTo(35);
        }];
        _inputValidationTF.layer.borderWidth = 1;
        _inputValidationTF.layer.borderColor = [kRGBColor(239, 239, 239, 1.0) CGColor];
        _inputValidationTF.placeholder = @"请输入验证码";
        _inputValidationTF.returnKeyType = UIReturnKeyGo;
        
        //"手机号"提示语
        UIView *validationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 58+7.5, 35)];
        UILabel *phoneNumber = [[UILabel alloc] initWithFrame:CGRectMake(7.5, 0, 58, 35)];
        phoneNumber.text = @"验证码";
        [validationView addSubview:phoneNumber];
        _inputValidationTF.leftView = validationView;
        _inputValidationTF.leftViewMode = UITextFieldViewModeAlways;
        //添加获取验证码按钮
        UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kValidationBtnWidth+10, 35)];
        [btnView addSubview:self.inputValidationBtn];
        _inputValidationTF.rightView = btnView;
        _inputValidationTF.rightViewMode = UITextFieldViewModeAlways;
    }
    return _inputValidationTF;
}

- (UIButton *)inputValidationBtn {
    if(_inputValidationBtn == nil) {
        _inputValidationBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _inputValidationBtn.frame = CGRectMake(0, 0, kValidationBtnWidth, 35);
        [_inputValidationBtn setTitle:@"验证" forState:UIControlStateNormal];
        [_inputValidationBtn setBackgroundColor:kRGBColor(86, 215, 42, 0.8)];
        _inputValidationBtn.layer.cornerRadius = 10;
        [_inputValidationBtn bk_addEventHandler:^(id sender) {
            [self inputValidationBtnClicked];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _inputValidationBtn;
}

- (UITextField *)userPwdTF {
	if(_userPwdTF == nil) {
		_userPwdTF = [[UITextField alloc] init];
        [self.view addSubview:_userPwdTF];
        [_userPwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(self.inputValidationTF.mas_bottom).equalTo(20);
            make.height.equalTo(35);
        }];
        _userPwdTF.layer.borderWidth = 1;
        _userPwdTF.layer.borderColor = [kRGBColor(239, 239, 239, 1.0) CGColor];
        //添加图片
        UIView *userView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        UIImageView *userIV = [[UIImageView alloc] initWithFrame:CGRectMake(7.5, 7.5, 15, 15)];
        userIV.image = [UIImage imageNamed:@"登录_密码"];
        [userView addSubview:userIV];
        _userPwdTF.leftView = userView;
        _userPwdTF.leftViewMode = UITextFieldViewModeAlways;
        _userPwdTF.placeholder = @"请输入密码";
        _userPwdTF.returnKeyType = UIReturnKeyGo;
        _userPwdTF.clearButtonMode = UITextFieldViewModeWhileEditing;
	}
	return _userPwdTF;
}

- (UITextField *)confirmPwdTF {
	if(_confirmPwdTF == nil) {
		_confirmPwdTF = [[UITextField alloc] init];
        [self.view addSubview:_confirmPwdTF];
        [_confirmPwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userPwdTF.mas_bottom).equalTo(10);
            make.left.right.equalTo(0);
            make.height.equalTo(35);
        }];
        _confirmPwdTF.layer.borderWidth = 1;
        _confirmPwdTF.layer.borderColor = [kRGBColor(239, 239, 239, 1.0) CGColor];
        //添加图片
        UIView *userView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        UIImageView *userIV = [[UIImageView alloc] initWithFrame:CGRectMake(7.5, 7.5, 15, 15)];
        userIV.image = [UIImage imageNamed:@"登录_密码"];
        [userView addSubview:userIV];
        _confirmPwdTF.leftView = userView;
        _confirmPwdTF.leftViewMode = UITextFieldViewModeAlways;
        _confirmPwdTF.placeholder = @"请再次确认密码";
        _confirmPwdTF.returnKeyType = UIReturnKeyGo;
        _confirmPwdTF.clearButtonMode = UITextFieldViewModeWhileEditing;
	}
	return _confirmPwdTF;
}

#pragma mark - Methods 
//Mob短信验证码SDK集成
- (void)validationBtnClicked {
    /**
     *  @from                    v1.1.1
     *  @brief                   获取验证码(Get verification code)
     *  @param method            获取验证码的方法(The method of getting verificationCode)
     *  @param phoneNumber       电话号码(The phone number)
     *  @param zone              区域号，不要加"+"号(Area code)
     *  @param customIdentifier  自定义短信模板标识 该标识需从官网http://www.mob.com上申请，审核通过后获得。
     *  @param result            请求结果回调(Results of the request)
     */
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.validationTF.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
            //NSLog(@"获取验证码成功");
            [self.view showWarning:@"获取验证码成功"];
        } else {
            //NSLog(@"错误信息：%@",error);
            [self.view showWarning:@"获取验证码失败"];
        }
    }];
}

- (void)inputValidationBtnClicked {
    [SMSSDK commitVerificationCode:self.inputValidationTF.text phoneNumber:self.validationTF.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            //NSLog(@"验证成功");
            [self.view showWarning:@"验证通过"];
        } else {
            //NSLog(@"错误信息:%@",error);
            [self.view showWarning:@"验证失败"];
        }
    }];
}

@end
