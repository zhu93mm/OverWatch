//
//  RecommendViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/5.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "RecommendViewController.h"
#import <iCarousel.h>

@interface RecommendViewController ()<UITableViewDelegate, UITableViewDataSource, iCarouselDelegate, iCarouselDataSource>

@property (nonatomic) UITableView *recommendTableView;
/** 头部滚动视图 */
@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIView *lineView;
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) UILabel *titleView;

@end

@implementation RecommendViewController
#pragma mark - iCarousel Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 4;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.frame];
        UIImageView *iconIV = [[UIImageView alloc] initWithFrame:CGRectZero];
        [view addSubview:iconIV];
        iconIV.contentMode = UIViewContentModeScaleAspectFill;
        //裁减掉多余部分
        iconIV.clipsToBounds = YES;
        [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        iconIV.image = [UIImage imageNamed:@"iconIV_BG"];
    }
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"The World need heros!";
    return cell;
}

#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"推荐";
        self.navigationItem.title = @"首页-推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"首页-推荐"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"首页-推荐点击"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self recommendTableView];
    self.recommendTableView.tableHeaderView = self.ic;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (UITableView *)recommendTableView {
	if(_recommendTableView == nil) {
		_recommendTableView = [[UITableView alloc] init];
        [self.view addSubview:_recommendTableView];
        [_recommendTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _recommendTableView.delegate = self;
        _recommendTableView.dataSource = self;
        [_recommendTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
	}
	return _recommendTableView;
}

- (iCarousel *)ic {
	if(_ic == nil) {
		_ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW * 370 / 750)];
        _ic.delegate = self;
        _ic.dataSource = self;
        [self lineView];
	}
	return _ic;
}

- (UIView *)lineView {
	if(_lineView == nil) {
		_lineView = [[UIView alloc] init];
        [self.ic addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(0);
            make.height.equalTo(30);
        }];
        _lineView.backgroundColor = kRGBColor(12, 12, 12, 0.6);
        [self pageControl];
        [self titleView];
	}
	return _lineView;
}

- (UIPageControl *)pageControl {
	if(_pageControl == nil) {
		_pageControl = [[UIPageControl alloc] init];
        [self.lineView addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-8);
        }];
        //不响应事件
        _pageControl.userInteractionEnabled = NO;
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.numberOfPages = 4;
	}
	return _pageControl;
}

- (UILabel *)titleView {
	if(_titleView == nil) {
		_titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 240)];
        [self.lineView addSubview:_titleView];
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(8);
        }];
        _titleView.text = @"The world need hero";
	}
	return _titleView;
}

@end
