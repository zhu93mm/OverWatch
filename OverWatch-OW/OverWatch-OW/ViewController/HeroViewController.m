//
//  HeroViewController.m
//  OverWatch-OW
//
//  Created by minmin on 16/7/5.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "HeroViewController.h"
#import "HerosViewCell.h"
#import "MMSkillsViewController.h"

@interface HeroViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *heroCollection;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end

@implementation HeroViewController
#pragma mark - Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 21;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HerosViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSArray *iconHeroArr = kIconHeroArray;
    NSArray *nameHeroArr = kNameHeroArray;
    NSString *iconStr = [NSString stringWithFormat:kIconHeroPath, iconHeroArr[indexPath.row]];
    [cell.iconIV setImageWithURL:[NSURL URLWithString:iconStr] placeholderImage:[UIImage imageNamed:@"bg-OW"]];
    cell.heroNameLb.text = nameHeroArr[indexPath.row];
    return cell;
}

//给cell添加动画
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    //设置Cell的动画效果为3D效果
    //设置x和y的初始值为0.1；
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    //x和y的最终值为1
    [UIView animateWithDuration:1 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    //获取英雄名字
    NSArray *nameHeroArr = kNameHeroArray;
    NSString *nameHero = [nameHeroArr[indexPath.row] substringFromIndex:3];
    MMSkillsViewController *skillsVC = [[MMSkillsViewController alloc] initWithName:nameHero];
    //设置“返回”按钮
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backBtn;
    [self.navigationController pushViewController:skillsVC animated:YES];
}

#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"英雄";
        self.navigationItem.title = @"世界需要英雄";
        self.tabBarItem.image = [UIImage imageNamed:@"首页-发现"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"首页-发现点击"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self heroCollection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (UICollectionView *)heroCollection {
	if(_heroCollection == nil) {
		_heroCollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _heroCollection.backgroundColor = kBGColor;
        [self.view addSubview:_heroCollection];
        [_heroCollection mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _heroCollection.delegate = self;
        _heroCollection.dataSource = self;
        [_heroCollection registerClass:[HerosViewCell class] forCellWithReuseIdentifier:@"Cell"];
	}
	return _heroCollection;
}

- (UICollectionViewFlowLayout *)flowLayout {
	if(_flowLayout == nil) {
		_flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);
        _flowLayout.minimumLineSpacing = 12.0;
        _flowLayout.minimumInteritemSpacing = 12.0;
        CGFloat width = (kScreenW - 12 * 4)/3;
        CGFloat height = width;
        _flowLayout.itemSize = CGSizeMake(width, height);
	}
	return _flowLayout;
}

@end
