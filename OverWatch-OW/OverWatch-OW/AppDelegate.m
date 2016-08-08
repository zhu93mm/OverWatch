//
//  AppDelegate.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/1.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "AppDelegate.h"
#import "RecommendViewController.h"
#import "HeroViewController.h"
#import "SquareViewController.h"
#import "MessageViewController.h"
#import "MyselfViewController.h"
#import <SMS_SDK/SMSSDK.h>
//#import "MMNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    
    //初始化应用，appKey和appSecret从后台申请得
    [SMSSDK registerApp:@"15abd4d324559" withSecret:@"3dd4fd515a28bd2a1dc43cd652089a8e"];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    _window.rootViewController = self.tabBarC;
    
    //用于测试请求数据是否成功
//    MMNetManager *netManager = [MMNetManager getPicWithAid:@"334753" completionHandler:^(MMPicModel *model, NSError *error) {
//        NSLog(@"");
//    }];
    
    return YES;
}

- (UITabBarController *)tabBarC {
    if(_tabBarC == nil) {
        _tabBarC = [[UITabBarController alloc] init];
        RecommendViewController *recommendVC = [RecommendViewController new];
        HeroViewController *heroVC = [HeroViewController new];
        SquareViewController *squareVC = [SquareViewController new];
        MessageViewController *messageVC = [MessageViewController new];
        MyselfViewController *myselfVC = [MyselfViewController new];
        
        UINavigationController *recommendNavi = [[UINavigationController alloc] initWithRootViewController:recommendVC];
        UINavigationController *heroNavi = [[UINavigationController alloc] initWithRootViewController:heroVC];
        UINavigationController *squareNavi = [[UINavigationController alloc] initWithRootViewController:squareVC];
        UINavigationController *messageNavi = [[UINavigationController alloc] initWithRootViewController:messageVC];
        UINavigationController *myselfNavi = [[UINavigationController alloc] initWithRootViewController:myselfVC];
        
        /* 上架 注释
        _tabBarC.viewControllers = @[recommendNavi, heroNavi, squareNavi, messageNavi, myselfNavi];
         */
        _tabBarC.viewControllers = @[recommendNavi, heroNavi];
        
        //统一设置导航栏格式
        [UINavigationBar appearance].barStyle = UIBarStyleBlack;
        [UINavigationBar appearance].backgroundColor = kRGBColor(12, 12, 12, 0.7);
        //设定返回按钮的颜色
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        //设定标题颜色
        //[[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
        //统一设置标签栏
        [UITabBar appearance].barTintColor = kRGBColor(12, 12, 12, 0.7);
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"MarkerFelt-Thin" size:12.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    }
    return _tabBarC;
}

@end
