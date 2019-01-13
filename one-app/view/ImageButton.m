//
// Created by jiyou xu on 2019-01-09.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "ImageButton.h"
#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ImageButton()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@end

@implementation ImageButton {

}

- (id)initWithImageUrl:(NSString *)imageUrl andTitle:(NSString *)title{
    if (self = [super init]) {
        _imageView = [[UIImageView alloc] init];
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"4"]];
        [self addSubview:self.imageView];

        _label = [[UILabel alloc] init];
        self.label.text = title;
        self.label.textColor = [UIColor whiteColor];
        [self addSubview:self.label];

        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(self);
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).offset(-12);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
}
@end