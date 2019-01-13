//
// Created by jiyou xu on 2019-01-12.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "FollowUserCell.h"
#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FollowUserCell()
@property (nonatomic, strong)UIImageView *headerImageView;
@property (nonatomic, strong)UIView *myView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *descLabel;
@end


@implementation FollowUserCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _headerImageView = [[UIImageView alloc] init];
        self.headerImageView.layer.cornerRadius = 28;
        self.headerImageView.layer.masksToBounds = YES;
        [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48"] placeholderImage:[UIImage imageNamed:@"4"]];
        [self.contentView addSubview:self.headerImageView];

        _myView = [[UIView alloc] init];
        [self.contentView addSubview:self.myView];

        _nameLabel = [[UILabel alloc] init];
        self.nameLabel.text = @"陈粒";
        self.nameLabel.textColor = [UIColor darkGrayColor];
        [self.myView addSubview:self.nameLabel];

        _descLabel = [[UILabel alloc] init];
        self.descLabel.textColor = [UIColor lightGrayColor];
        self.descLabel.text = @"音乐人";
        [self.myView addSubview:self.descLabel];

        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(16);
        make.top.mas_equalTo(self.contentView).offset(12);
        make.width.mas_equalTo(56);
        make.height.mas_equalTo(56);
    }];
    [self.myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headerImageView.mas_right).offset(12);
        make.centerY.mas_equalTo(self.headerImageView);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.myView);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(4);
        make.bottom.left.right.mas_equalTo(self.myView);
    }];

    UIImageView *rightImageView = [[UIImageView alloc] init];
    UIImage *image = [UIImage imageNamed:@"icons8-向前-50"];
    rightImageView.image = image;
    [self.contentView addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.headerImageView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
        make.width.height.mas_equalTo(20);
    }];

    UIView *divide = [[UIView alloc] init];
    divide.backgroundColor = [[UIColor alloc] initWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1.0];
    [self.contentView addSubview:divide];
    [divide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerImageView.mas_bottom).offset(12);
        make.height.mas_equalTo(1);
        make.left.right.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView);
    }];


}
@end