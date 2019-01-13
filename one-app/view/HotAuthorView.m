//
// Created by jiyou xu on 2019-01-10.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "HotAuthorView.h"
#import "UserView.h"
#import "UserPageController.h"


@implementation HotAuthorView

- (id)init{
    if (self = [super init]) {
        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"近期热门作者";
    label.textColor = [UIColor darkGrayColor];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(20);
        make.left.mas_equalTo(self.mas_left).offset(16);
    }];

    UserView *oneUserView = [[UserView alloc] initWithImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andName:@"张晓晗" andDesc:@"作家，编剧，银河系少先队队员大队长"];
    [oneUserView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneUserView:)]];
    [self addSubview:oneUserView];
    [oneUserView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).offset(30);
        make.left.right.mas_equalTo(self);
    }];

    UserView *twoUserView = [[UserView alloc] initWithImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andName:@"张晓晗" andDesc:@"作家，编剧，银河系少先队队员大队长"];
    [twoUserView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneUserView:)]];
    [self addSubview:twoUserView];
    [twoUserView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(oneUserView.mas_bottom).offset(30);
        make.left.right.mas_equalTo(self);
    }];

    UserView *threeUserView = [[UserView alloc] initWithImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andName:@"张晓晗" andDesc:@"作家，编剧，银河系少先队队员大队长"];
    [threeUserView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneUserView:)]];
    [self addSubview:threeUserView];
    [threeUserView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(twoUserView.mas_bottom).offset(30);
        make.left.right.mas_equalTo(self);
    }];

    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [changeButton setTitle:@"换一换" forState:UIControlStateNormal];
    [changeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    changeButton.layer.masksToBounds = YES;
    changeButton.layer.cornerRadius = 4;
    changeButton.layer.borderWidth = 1.0;
    changeButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self addSubview:changeButton];
    [changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(threeUserView.mas_bottom).offset(30);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(36);
    }];

    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(changeButton.mas_bottom).offset(30);
    }];
}

- (void)tapOneUserView:(id)tapOneUserView {
    [self.navigationController pushViewController:[[UserPageController alloc] init] animated:YES];
}
@end