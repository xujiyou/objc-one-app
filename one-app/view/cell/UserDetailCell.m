//
// Created by jiyou xu on 2019-01-12.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "UserDetailCell.h"
#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface UserDetailCell()
@property (nonatomic, strong)UIImageView *headerImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *descLabel;
@property (nonatomic, strong)UILabel *worksLabel;
@property (nonatomic, strong)UIButton *followButton;
@property (nonatomic, strong)UILabel *followCountLabel;
@end

@implementation UserDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _headerImageView = [[UIImageView alloc] init];
        [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48"] placeholderImage:[UIImage imageNamed:@"4"]];
        self.headerImageView.layer.cornerRadius = 40;
        self.headerImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.headerImageView];

        _nameLabel = [[UILabel alloc] init];
        self.nameLabel.text = @"张晓涵";
        [self.nameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
        [self.contentView addSubview:self.nameLabel];

        _descLabel = [[UILabel alloc] init];
        self.descLabel.text = @"作家、编剧】银河系少先队员大队长";
        self.descLabel.numberOfLines = 0;
        self.descLabel.textAlignment = NSTextAlignmentCenter;
        self.descLabel.textColor = [UIColor lightGrayColor];
        self.descLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.descLabel];

        _worksLabel = [[UILabel alloc] init];
        self.worksLabel.text = @"已出版《女王乔安》、《少年博物馆》等。@张晓晗Oliver，ID：银河系会玩";
        self.worksLabel.numberOfLines = 0;
        self.worksLabel.textAlignment = NSTextAlignmentCenter;
        self.worksLabel.textColor = [UIColor darkGrayColor];
        self.worksLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.worksLabel];

        _followButton = [[UIButton alloc] init];
        [self.followButton setTitle:@"关注" forState:UIControlStateNormal];
        [self.followButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        self.followButton.layer.masksToBounds = YES;
        self.followButton.layer.cornerRadius = 4;
        self.followButton.layer.borderWidth = 1.0;
        self.followButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self.contentView addSubview:self.followButton];

        _followCountLabel = [[UILabel alloc] init];
        self.followCountLabel.text = @"47058关注";
        self.followCountLabel.textColor = [UIColor lightGrayColor];
        self.followCountLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.followCountLabel];

        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{

    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(20);
        make.centerX.mas_equalTo(self.contentView);
        make.width.height.mas_equalTo(80);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerImageView.mas_bottom).offset(12);
        make.centerX.mas_equalTo(self.headerImageView);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(12);
        make.left.mas_equalTo(self.contentView).offset(50);
        make.right.mas_equalTo(self.contentView).offset(-50);
        make.centerX.mas_equalTo(self.headerImageView);
    }];
    [self.worksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.descLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(self.contentView).offset(50);
        make.right.mas_equalTo(self.contentView).offset(-50);
        make.centerX.mas_equalTo(self.headerImageView);
    }];
    [self.followButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.worksLabel.mas_bottom).offset(16);
        make.centerX.mas_equalTo(self.headerImageView);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(36);
    }];
    [self.followCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.followButton.mas_bottom).offset(20);
        make.centerX.mas_equalTo(self.headerImageView);
    }];

    UIView *divide = [[UIView alloc] init];
    divide.backgroundColor = [[UIColor alloc] initWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1.0];
    [self.contentView addSubview:divide];
    [divide mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.followCountLabel.mas_bottom).offset(12);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(12);
        make.bottom.mas_equalTo(self.contentView);
    }];
}
@end