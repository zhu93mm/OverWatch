//
//  RecommendViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/5.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "RecommendViewController.h"
#import <iCarousel.h>
#import "MMRecommendCell.h"
#import "MMPicRecommendCell.h"
#import "MMRecomViewModel.h"

@interface RecommendViewController ()<UITableViewDelegate, UITableViewDataSource, iCarouselDelegate, iCarouselDataSource>

@property (nonatomic) UITableView *recommendTableView;
@property (nonatomic) MMRecomViewModel *recomVM;

/** 头部滚动视图 */
@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIView *lineView;
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) UILabel *titleView;

@end

@implementation RecommendViewController
#pragma mark - iCarousel Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.recomVM.indexpicList.count;
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
        [iconIV setImageWithURL:[self.recomVM picURLIndexForRow:index] placeholder:[UIImage imageNamed:@"bg-OW"]];
    }
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

//KVO观察者模式
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pageControl.currentPage = carousel.currentItemIndex;
    _titleView.text = [self.recomVM titleIndexForRow:carousel.currentItemIndex];
}

#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.recomVM.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    CellType type = [self.recomVM cellType:indexPath.row];
    switch (type) {
        case all: {
            MMRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MMRecommendCell" forIndexPath:indexPath];
            [cell.iconIV setImageWithURL:[self.recomVM picURLForRow:row] placeholder:[UIImage imageNamed:@"bg-OW"]];
            cell.titleL.text = [self.recomVM titleForRow:row];
            cell.contentL.text = [self.recomVM contentForRow:row];
            cell.numL.text = [self.recomVM numberForRow:row];
            return cell;
        }
        case pic: {
            MMPicRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MMPicRecommendCell" forIndexPath:indexPath];
            cell.numL.text = [self.recomVM numberForRow:row];
            cell.titleL.text = [self.recomVM titleForRow:row];
            return cell;
        }
        default: {
            MMRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MMRecommendCell" forIndexPath:indexPath];
            [cell.iconIV setImageWithURL:[self.recomVM picURLForRow:row] placeholder:[UIImage imageNamed:@"bg-OW"]];
            cell.titleL.text = [self.recomVM titleForRow:row];
            cell.contentL.text = [self.recomVM contentForRow:row];
            cell.numL.text = [self.recomVM numberForRow:row];
            return cell;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CellType type = [self.recomVM cellType:indexPath.row];
    if (type == pic) {
        return [tableView fd_heightForCellWithIdentifier:@"MMPicRecommendCell" configuration:^(MMRecommendCell *cell) {
        }];
    }else {
        return [tableView fd_heightForCellWithIdentifier:@"MMRecommendCell" configuration:^(MMPicRecommendCell *cell) {
        }];
    }
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
    [self.recommendTableView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (UITableView *)recommendTableView {
	if(_recommendTableView == nil) {
		_recommendTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _recommendTableView.delegate = self;
        _recommendTableView.dataSource = self;
        [_recommendTableView registerClass:[MMRecommendCell class] forCellReuseIdentifier:@"MMRecommendCell"];
        [_recommendTableView registerClass:[MMPicRecommendCell class] forCellReuseIdentifier:@"MMPicRecommendCell"];
        WK(weakSelf);
        [weakSelf.recommendTableView addHeaderRefresh:^{
            [weakSelf.recomVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.recommendTableView reloadData];
                    self.recommendTableView.tableHeaderView = self.ic;
                }
                [weakSelf.recommendTableView endHeaderRefresh];
            }];
        }];
        [weakSelf.recommendTableView addBackFooterRefresh:^{
            [weakSelf.recomVM getDataWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.recommendTableView reloadData];
                    self.recommendTableView.tableHeaderView = self.ic;
                }
            }];
            [weakSelf.recommendTableView endFooterRefresh];
        }];
        [weakSelf.view addSubview:_recommendTableView];
        [_recommendTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
	}
	return _recommendTableView;
}

- (iCarousel *)ic {
	if(_ic == nil) {
		_ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW * 370 / 750)];
        _ic.delegate = self;
        _ic.dataSource = self;
        [self lineView];
        [self carouselCurrentItemIndexDidChange:_ic];
        //头部滑动视图定时滚动
        [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
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
        _pageControl.numberOfPages = self.recomVM.indexpicList.count;
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
            make.width.lessThanOrEqualTo(290);
        }];
        _titleView.textColor = [UIColor whiteColor];
        _titleView.font = [UIFont systemFontOfSize:12];
	}
	return _titleView;
}

- (MMRecomViewModel *)recomVM {
	if(_recomVM == nil) {
		_recomVM = [[MMRecomViewModel alloc] initWithType:RecomTypeZuiXin];
	}
	return _recomVM;
}

@end
