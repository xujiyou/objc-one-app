//
// Created by jiyou xu on 2019-01-12.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "TuWenPageController.h"
#import "Masonry.h"
#import "TuWenCell.h"

static CGFloat const heightCollectionCell = 160.0;


@interface TuWenPageController()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@end


@implementation TuWenPageController


double widthCollectionCell;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"图文";
    self.view.backgroundColor = [UIColor whiteColor];
    widthCollectionCell = (([UIScreen mainScreen].bounds.size.width - 24.0) / 2);

    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:fl];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    fl.minimumLineSpacing = 20;
    fl.minimumInteritemSpacing = 8;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[TuWenCell class] forCellWithReuseIdentifier:TU_WEN_CELL_REUSE_IDENTIFIER];

    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.view);
        make.left.right.mas_equalTo(self.view);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 24;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TuWenCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:TU_WEN_CELL_REUSE_IDENTIFIER forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 4;
    cell.layer.borderWidth = 1.0;
    cell.layer.borderColor = [[UIColor alloc] initWithRed:(CGFloat) (220 / 255.0) green:(CGFloat) (220 / 255.0) blue:(CGFloat) (220 / 255.0) alpha:1.0].CGColor;
    [cell setImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andName:@"2019 / 01 / 11"];
    return cell;
}


// 定义每个UICollectionViewCell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((CGFloat) widthCollectionCell, heightCollectionCell);
}

//定义每个Section的四边间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(20, 8, 20, 8);//分别为上、左、下、右
}

@end