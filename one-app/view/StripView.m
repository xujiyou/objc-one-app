//
// Created by jiyou xu on 2019-01-11.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "StripView.h"
#import "Masonry.h"

@interface StripView()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nameLabel;
@end


@implementation StripView

- (id)initWithIconName:(NSString *)iconName andName:(NSString *)name{
    if (self = [super init]) {
        _imageView = [[UIImageView alloc] init];
        UIImage *image = [UIImage imageNamed:iconName];
        self.imageView.image = image;
        [self addSubview:self.imageView];

        _nameLabel = [[UILabel alloc] init];
        self.nameLabel.text = name;
        self.nameLabel.font = [UIFont systemFontOfSize:16];
        self.nameLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:self.nameLabel];

        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(20);
        make.top.mas_equalTo(self).offset(16);
        make.bottom.mas_equalTo(self).offset(-16);
        make.width.height.mas_equalTo(20);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.imageView.mas_centerY);
        make.left.mas_equalTo(self.imageView.mas_right).offset(12);
    }];

    UIImageView *rightImageView = [[UIImageView alloc] init];
    UIImage *image = [UIImage imageNamed:@"icons8-向前-50"];
    rightImageView.image = image;
    [self addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.imageView.mas_centerY);
        make.right.mas_equalTo(self.mas_right).offset(-16);
        make.width.height.mas_equalTo(20);
    }];
}
@end