//
//  MMDetailViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/25.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMDetailViewController.h"

@interface MMDetailViewController ()<UIWebViewDelegate>

@end

@implementation MMDetailViewController

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.view showBusyHUD];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.view hideBusyHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.view showWarning:error.description];
}

#pragma mark - LifeCycle 生命周期
- (instancetype)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        _url = url;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [UIWebView new];
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    webView.delegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:_url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
