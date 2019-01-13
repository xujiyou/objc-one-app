//
// Created by jiyou xu on 2019-01-12.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "CultureCell.h"
#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CultureCell()
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong)UIView *view;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@end

@implementation CultureCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        _headerImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headerImageView];

        _view = [[UIView alloc] init];
        [self.contentView addSubview:self.view];

        _titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor darkGrayColor];
        [self.view addSubview:self.titleLabel];

        _descLabel = [[UILabel alloc] init];
        self.descLabel.textColor = [UIColor lightGrayColor];
        self.descLabel.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:self.descLabel];

        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(10);
        make.left.mas_equalTo(self.contentView).offset(16);
        make.width.height.mas_equalTo(60);
    }];

    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headerImageView.mas_right).offset(12);
        make.right.mas_equalTo(self.contentView.mas_right).offset(0);
        make.centerY.mas_equalTo(self.headerImageView.mas_centerY);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view.mas_right);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(4);
        make.left.bottom.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view.mas_right);
    }];

    UIView *divide = [[UIView alloc] init];
    divide.backgroundColor = [[UIColor alloc] initWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1.0];
    [self.contentView addSubview:divide];
    [divide mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(self.headerImageView.mas_bottom).offset(10);
       make.height.mas_equalTo(1);
       make.left.right.mas_equalTo(self.contentView);
    }];
    double width = [UIScreen mainScreen].bounds.size.width;

    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(divide.mas_bottom);
        make.width.mas_equalTo(width);
    }];
}

- (void)setImageUrl:(NSString *)imageUrl andTitle:(NSString *)title andDesc:(NSString *)desc{
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"4"]];
    self.titleLabel.text = title;
    self.descLabel.text = desc;
}
@end