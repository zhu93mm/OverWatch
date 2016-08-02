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
#import "MMDetailViewController.h"
#import "MMPicViewController.h"
//#import "MMVideoViewController.h"

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
    //return self.recomVM.indexpicList.count;
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
        iconIV.tag = 1000;
        [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    UIImageView *iconIV = (UIImageView *)[view viewWithTag:1000];
    //[iconIV setImageWithURL:[self.recomVM picURLIndexForRow:index]];
    [iconIV setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"bg-OW"]];
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
    //_titleView.text = [self.recomVM titleIndexForRow:carousel.currentItemIndex];
    _titleView.text = @"the world need heros!";
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
            [cell.iconIV1 setImageWithURL:[self.recomVM iconURLForRow:row withIndex:0] placeholder:[UIImage imageNamed:@"bg-OW"]];
            [cell.iconIV2 setImageWithURL:[self.recomVM iconURLForRow:row withIndex:1] placeholder:[UIImage imageNamed:@"bg-OW"]];
            [cell.iconIV3 setImageWithURL:[self.recomVM iconURLForRow:row withIndex:2] placeholder:[UIImage imageNamed:@"bg-OW"]];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger row = indexPath.row;
    CellType type = [self.recomVM cellType:row];
    switch (type) {
        case all: {
            //用于测试网址
//            if (row == 2) {
//                MMDetailViewController *detailVC = [[MMDetailViewController alloc] initWithURL:[NSURL URLWithString:@"http://m.tuwan.com/ow/334759/"]];
//                [self.navigationController pushViewController:detailVC animated:YES];
//                return;
//            }
            MMDetailViewController *detailVC = [[MMDetailViewController alloc] initWithURL:[self.recomVM viewForRow:row]];
            [self.navigationController pushViewController:detailVC animated:YES];
            break;
        }
        case pic: {
            MMPicViewController *picVC = [[MMPicViewController alloc] initWithAid:[self.recomVM aidForRow:row]];
            [self.navigationController pushViewController:picVC animated:YES];
            break;
        }
        default: {
            /* 正常使用视频播放控件
            MMVideoViewController *videoVC = [[MMVideoViewController alloc] initWithAid:[self.recomVM aidForRow:row]];
            [self.navigationController pushViewController:videoVC animated:YES];
             */
            
            // 直接利用抓取网页
            NSString *aid = [self.recomVM aidForRow:row];
            NSString *videoUrl = [NSString stringWithFormat:@"http://m.tuwan.com/ow/%@/", aid];
            MMDetailViewController *detailVC = [[MMDetailViewController alloc] initWithURL:[NSURL URLWithString:videoUrl]];
            [self.navigationController pushViewController:detailVC animated:YES];
        }
    }
}

/* 给cell添加动画
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //设置Cell的动画效果为3D效果
    //设置x和y的初始值为0.1；
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    //x和y的最终值为1
    [UIView animateWithDuration:1 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}
 */

#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"推荐";
        self.navigationItem.title = @"首页-推荐";
        //设定navigation的返回按钮
        //UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
        //backItem.title = @"返回";
        //self.navigationItem.backBarButtonItem = backItem;
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
        //_pageControl.numberOfPages = self.recomVM.indexpicList.count;
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
