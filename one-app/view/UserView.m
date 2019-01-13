//
// Created by jiyou xu on 2019-01-10.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "UserView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Masonry.h"

@interface UserView()
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UIView *view;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *descLabel;
@property (nonatomic, strong)UIButton *followButton;
@end

@implementation UserView

- (id)initWithImageUrl:(NSString *)imageUrl andName:(NSString *)name andDesc:(NSString *)desc{
    if (self = [super init]) {
        _imageView = [[UIImageView alloc] init];
        self.imageView.layer.cornerRadius = 28;
        self.imageView.layer.masksToBounds = YES;
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"4"]];
        [self addSubview:self.imageView];

        _view = [[UIView alloc] init];
        [self addSubview:self.view];

        _nameLabel = [[UILabel alloc] init];
        self.nameLabel.text = name;
        self.nameLabel.textColor = [UIColor darkGrayColor];
        [self.view addSubview:self.nameLabel];

        _descLabel = [[UILabel alloc] init];
        self.descLabel.text = desc;
        self.descLabel.textColor = [UIColor lightGrayColor];
        self.descLabel.font = [UIFont systemFontOfSize:12];
        [self.view addSubview:self.descLabel];

        _followButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.followButton setTitle:@"关注" forState:UIControlStateNormal];
        [self.followButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        self.followButton.layer.masksToBounds = YES;
        self.followButton.layer.cornerRadius = 4;
        self.followButton.layer.borderWidth = 1.0;
        self.followButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self addSubview:self.followButton];

        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self).offset(16);
        make.width.mas_equalTo(56);
        make.height.mas_equalTo(56);
    }];

    [self.followButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.imageView.mas_centerY);
        make.right.mas_equalTo(self.mas_right).offset(-16);
        make.width.mas_equalTo(54);
        make.height.mas_equalTo(32);
    }];

    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.mas_equalTo(self.imageView.mas_right).offset(12);
       make.right.mas_equalTo(self.followButton.mas_left).offset(-4);
       make.centerY.mas_equalTo(self.imageView.mas_centerY);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.left.right.mas_equalTo(self.view);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(4);
       make.left.right.bottom.mas_equalTo(self.view);
    }];


    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.imageView.mas_bottom);
    }];
}
@end