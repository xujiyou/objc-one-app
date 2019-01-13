//
// Created by jiyou xu on 2019-01-10.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "MeButton.h"
#import "UIImage+FontAwesome.h"

@interface MeButton()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *nameLabel;
@end


@implementation MeButton

- (id)initWithIconName:(NSString *)iconName withName:(NSString *)name{
    if (self = [super init]) {
        _imageView = [[UIImageView alloc] init];
        self.imageView.image = [UIImage imageNamed:iconName];
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
        make.top.right.left.mas_equalTo(self);
        make.width.height.mas_equalTo(32);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(8);
        make.centerX.mas_equalTo(self.imageView.mas_centerX);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
}
@end