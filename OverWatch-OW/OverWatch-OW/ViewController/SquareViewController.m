//
//  SquareViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/5.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "SquareViewController.h"

@interface SquareViewController ()

@end

@implementation SquareViewController

- (instancetype)init{
    if (self = [super init]) {
        self.title = @"广场";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"在这里停顿";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
