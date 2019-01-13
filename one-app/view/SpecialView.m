//
// Created by jiyou xu on 2019-01-10.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "SpecialView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Masonry.h"

@interface SpecialView()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@end


@implementation SpecialView {

}

- (id)init{
    if (self = [super init]) {
        _imageView = [[UIImageView alloc] init];
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48"] placeholderImage:[UIImage imageNamed:@"4"]];
        [self addSubview:self.imageView];

        _label = [[UILabel alloc] init];
        self.label.text = @"我们在2018年追了这些剧";
        self.label.textColor = UIColor.darkGrayColor;
        self.label.font = [UIFont systemFontOfSize:18];
        [self addSubview:self.label];

        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{
    double imageHeight = [UIScreen mainScreen].bounds.size.width / 2;

    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(20);
        make.left.mas_equalTo(self).offset(16);
        make.right.mas_equalTo(self).offset(-16);
        make.height.mas_equalTo(imageHeight);
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(20);
        make.left.mas_equalTo(self).offset(16);
        make.right.mas_equalTo(self).offset(-16);
    }];

    UIView *divide = [[UIView alloc] init];
    divide.backgroundColor = [[UIColor alloc] initWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1.0];
    [self addSubview:divide];
    [divide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label.mas_bottom).offset(30);
        make.height.mas_equalTo(8);
        make.left.right.mas_equalTo(self);
    }];

    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(divide.mas_bottom);
    }];
}
@end