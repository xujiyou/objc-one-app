//
// Created by jiyou xu on 2019-01-06.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "MeController.h"
#import "Masonry.h"
#import "MeButton.h"
#import "StripView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MyFollowPageController.h"

@interface MeController() <UINavigationControllerDelegate>
@property (nonatomic, strong)UIImageView *backgroundImageView;
@property (nonatomic, strong)UIImageView *headerImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@end

@implementation MeController

- (void)viewDidLoad {
    [super viewDidLoad];

    _backgroundImageView = [[UIImageView alloc] init];
    [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:@"http://pics.vidovision.com/5c3880366b563078870b7358"] placeholderImage:[UIImage imageNamed:@"4"]];
    [self.view addSubview:self.backgroundImageView];

    _headerImageView = [[UIImageView alloc] init];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48"] placeholderImage:[UIImage imageNamed:@"4"]];
    self.headerImageView.layer.cornerRadius = 40;
    self.headerImageView.layer.masksToBounds = YES;
    [self.view addSubview:self.headerImageView];

    _nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"落寞千秋";
    self.nameLabel.textColor = [UIColor whiteColor];
    [self.nameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [self.view addSubview:self.nameLabel];

    [self settingLayout];
}

- (void)settingLayout{
    double height = [UIScreen mainScreen].bounds.size.width * 0.64;

    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(height);
    }];
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.backgroundImageView.mas_top).offset(60);
        make.height.width.mas_equalTo(80);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerImageView.mas_bottom).offset(16);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];

    double width = [UIScreen mainScreen].bounds.size.width;

    MeButton *tuWenButton = [[MeButton alloc] initWithIconName:@"icons8-图片-50" withName:@"图文"];
    [self.view addSubview:tuWenButton];
    [tuWenButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backgroundImageView.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self.view.mas_left).offset((CGFloat) (width / 10));
    }];

    MeButton *wenZhangButton = [[MeButton alloc] initWithIconName:@"icons8-书签-50" withName:@"文章"];
    [self.view addSubview:wenZhangButton];
    [wenZhangButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backgroundImageView.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self.view.mas_left).offset((CGFloat) (width / 10 * 3));
    }];

    MeButton *yinYueButton = [[MeButton alloc] initWithIconName:@"icons8-浏览播客-50" withName:@"音乐"];
    [self.view addSubview:yinYueButton];
    [yinYueButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backgroundImageView.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self.view.mas_left).offset((CGFloat) (width / 10 * 5));
    }];

    MeButton *yingShiButton = [[MeButton alloc] initWithIconName:@"icons8-老版instagram-50" withName:@"影视"];
    [self.view addSubview:yingShiButton];
    [yingShiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backgroundImageView.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self.view.mas_left).offset((CGFloat) (width / 10 * 7));
    }];

    MeButton *dianTaiButton = [[MeButton alloc] initWithIconName:@"icons8-reddit-50" withName:@"电台"];
    [self.view addSubview:dianTaiButton];
    [dianTaiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.backgroundImageView.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self.view.mas_left).offset((CGFloat) (width / 10 * 9));
    }];

    UIView *divide = [[UIView alloc] init];
    divide.backgroundColor = [[UIColor alloc] initWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1.0];
    [self.view addSubview:divide];
    [divide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tuWenButton.mas_bottom).offset(20);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(1);
    }];

    StripView *guanZhuStripView = [[StripView alloc] initWithIconName:@"icons8-无线电波-50" andName:@"我的关注"];
    [guanZhuStripView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGuanZhuStripView:)]];
    [self.view addSubview:guanZhuStripView];
    [guanZhuStripView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(divide.mas_bottom);
        make.left.right.mas_equalTo(self.view);
    }];

    UIView *secondDivide = [[UIView alloc] init];
    secondDivide.backgroundColor = [[UIColor alloc] initWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1.0];
    [self.view addSubview:secondDivide];
    [secondDivide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(guanZhuStripView.mas_bottom);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(1);
    }];

    StripView *geQuStripView = [[StripView alloc] initWithIconName:@"icons8-头戴耳机-50" andName:@"我的歌单"];
    [self.view addSubview:geQuStripView];
    [geQuStripView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(secondDivide.mas_bottom);
        make.left.right.mas_equalTo(self.view);
    }];

    UIView *thirdDivide = [[UIView alloc] init];
    thirdDivide.backgroundColor = [[UIColor alloc] initWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1.0];
    [self.view addSubview:thirdDivide];
    [thirdDivide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(geQuStripView.mas_bottom);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(1);
    }];
}

- (void)tapGuanZhuStripView:(id)tapGuanZhuStripView {
    [self.navigationController pushViewController:[[MyFollowPageController alloc] init] animated:YES];
}

#pragma mark 设置状态栏字体颜色为白色

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
@end