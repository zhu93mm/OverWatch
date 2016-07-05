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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupGlobalConfig];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    _window.rootViewController = self.tabBarC;
    
    return YES;
}

- (UITabBarController *)tabBarC {
    if(_tabBarC == nil) {
        _tabBarC = [[UITabBarController alloc] init];
        RecommendViewController *recommendVC = [RecommendViewController new];
        HeroViewController *heroVC = [HeroViewController new];
        SquareViewController *squareVC = [SquareViewController new];
        MessageViewController 
        
        UINavigationController *heroNavi = [[UINavigationController alloc] initWithRootViewController:heroVC];
        
        _tabBarC.viewControllers = @[heroNavi];
    }
    return _tabBarC;
}

@end
