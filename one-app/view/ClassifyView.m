//
// Created by jiyou xu on 2019-01-09.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "ClassifyView.h"
#import "ImageButton.h"
#import "TuWenPageController.h"
#import "CultureListController.h"


@implementation ClassifyView

- (id)init{
    if (self = [super init]) {
        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"分类导航";
    titleLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:titleLabel];

    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(16);
        make.top.mas_equalTo(self.mas_top).offset(16);
    }];

    double imageWidth = ([UIScreen mainScreen].bounds.size.width - 28) / 4 - 4;

    ImageButton *tuWenImageButton = [[ImageButton alloc] initWithImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andTitle:@"图文"];
    [tuWenImageButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTuWenButton:)]];
    [self addSubview:tuWenImageButton];
    [tuWenImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(self).offset(16);
        make.width.height.mas_equalTo(imageWidth);
    }];
    
    ImageButton *wenDaImageButton = [[ImageButton alloc]initWithImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andTitle:@"问答"];
    [wenDaImageButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapWenDaButton:)]];
    [self addSubview:wenDaImageButton];
    [wenDaImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(tuWenImageButton.mas_right).offset(4);
        make.width.height.mas_equalTo(imageWidth);
    }];

    ImageButton *yueDuImageButton = [[ImageButton alloc]initWithImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andTitle:@"阅读"];
    [yueDuImageButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapYueDuButton:)]];
    [self addSubview:yueDuImageButton];
    [yueDuImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(wenDaImageButton.mas_right).offset(4);
        make.width.mas_equalTo(imageWidth * 2 + 4);
        make.height.mas_equalTo(imageWidth);
    }];

    ImageButton *lianZaiImageButton = [[ImageButton alloc]initWithImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andTitle:@"连载"];
    [lianZaiImageButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLianZaiButton:)]];
    [self addSubview:lianZaiImageButton];
    [lianZaiImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tuWenImageButton.mas_bottom).offset(4);
        make.left.mas_equalTo(self).offset(16);
        make.width.height.mas_equalTo(imageWidth);
    }];

    ImageButton *yingShiImageButton = [[ImageButton alloc]initWithImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andTitle:@"影视"];
    [yingShiImageButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapYingShiButton:)]];
    [self addSubview:yingShiImageButton];
    [yingShiImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tuWenImageButton.mas_bottom).offset(4);
        make.left.mas_equalTo(lianZaiImageButton.mas_right).offset(4);
        make.width.height.mas_equalTo(imageWidth);
    }];

    ImageButton *yinYueImageButton = [[ImageButton alloc]initWithImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andTitle:@"音乐"];
    [yinYueImageButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapYinYueButton:)]];
    [self addSubview:yinYueImageButton];
    [yinYueImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tuWenImageButton.mas_bottom).offset(4);
        make.left.mas_equalTo(yingShiImageButton.mas_right).offset(4);
        make.width.height.mas_equalTo(imageWidth);
    }];

    ImageButton *dianTaiImageButton = [[ImageButton alloc]initWithImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andTitle:@"电台"];
    [dianTaiImageButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDianTaiButton:)]];
    [self addSubview:dianTaiImageButton];
    [dianTaiImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tuWenImageButton.mas_bottom).offset(4);
        make.left.mas_equalTo(yinYueImageButton.mas_right).offset(4);
        make.width.height.mas_equalTo(imageWidth);
    }];

    UIView *divide = [[UIView alloc] init];
    divide.backgroundColor = [[UIColor alloc] initWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1.0];
    [self addSubview:divide];
    [divide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(dianTaiImageButton.mas_bottom).offset(30);
        make.height.mas_equalTo(8);
        make.left.right.mas_equalTo(self);
    }];

    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(divide.mas_bottom);
    }];
}

- (void)tapTuWenButton:(UITapGestureRecognizer *)tapGestureRecognizer{
    [self.navigationController pushViewController:[[TuWenPageController alloc] init] animated:true];
}

- (void)tapWenDaButton:(UITapGestureRecognizer *)tapGestureRecognizer{
    [self.navigationController pushViewController:[[CultureListController alloc] init] animated:true];
}

- (void)tapYueDuButton:(UITapGestureRecognizer *)tapGestureRecognizer {
    [self.navigationController pushViewController:[[CultureListController alloc] init] animated:true];
}

- (void)tapLianZaiButton:(UITapGestureRecognizer *)tapGestureRecognizer {
    [self.navigationController pushViewController:[[CultureListController alloc] init] animated:true];
}

- (void)tapYingShiButton:(UITapGestureRecognizer *)tapGestureRecognizer {
    [self.navigationController pushViewController:[[CultureListController alloc] init] animated:true];
}


- (void)tapYinYueButton:(UITapGestureRecognizer *)tapGestureRecognizer {
    [self.navigationController pushViewController:[[CultureListController alloc] init] animated:true];
}

- (void)tapDianTaiButton:(UITapGestureRecognizer *)tapGestureRecognizer {
    [self.navigationController pushViewController:[[CultureListController alloc] init] animated:true];
}
@end
