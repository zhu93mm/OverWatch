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
//#import "MMNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupGlobalConfig];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    _window.rootViewController = self.tabBarC;
    
    //用于测试请求数据是否成功
//    MMNetManager *netManager = [MMNetManager getRecommend:nil start:1 completionHandler:^(MMRecommendModel *model, NSError *error) {
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
        
        _tabBarC.viewControllers = @[recommendNavi, heroNavi, squareNavi, messageNavi, myselfNavi];
        
        //统一设置导航栏格式
        [UINavigationBar appearance].barStyle = UIBarStyleBlack;
        [UINavigationBar appearance].backgroundColor = kRGBColor(12, 12, 12, 0.7);
        //统一设置标签栏
        [UITabBar appearance].barTintColor = kRGBColor(12, 12, 12, 0.7);
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"MarkerFelt-Thin" size:12.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    }
    return _tabBarC;
}

@end
