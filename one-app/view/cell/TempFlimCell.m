//
// Created by jiyou xu on 2019-01-12.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "TempFlimCell.h"
#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TempFlimCell()
@property (nonatomic, strong)UIView *myView;
@property (nonatomic, strong)UIImageView *headerImageView;
@property (nonatomic, strong)UILabel *filmLabel;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *descLabel;
@property (nonatomic, strong)UILabel *authorLabel;
@property (nonatomic, strong)UILabel *loveCountLabel;
@end

@implementation TempFlimCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor redColor];

        _myView = [[UIView alloc] init];
        self.myView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.myView];

        _headerImageView = [[UIImageView alloc] init];
        [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48"] placeholderImage:[UIImage imageNamed:@"4"]];
        [self.contentView addSubview:self.headerImageView];

        _filmLabel = [[UILabel alloc] init];
        self.filmLabel.text = @"《利器》";
        self.filmLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.filmLabel];

        _titleLabel = [[UILabel alloc] init];
        self.titleLabel.numberOfLines = 0;
        NSString *title = @"这部美剧，让我拥有了一个冷彻骨髓的夏天";
        self.titleLabel.text = title;
        self.titleLabel.textColor = [UIColor darkGrayColor];
        self.titleLabel.font = [UIFont systemFontOfSize:20];
        [self setLineSpace:8.0f withText:title inLabel:self.titleLabel];
        [self.contentView addSubview:self.titleLabel];

        _descLabel = [[UILabel alloc] init];
        self.descLabel.numberOfLines = 0;
        self.descLabel.text = @"她让自己的肉体，成为了一座铜鼓的墓碑";
        self.descLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.descLabel];

        _authorLabel = [[UILabel alloc] init];
        self.authorLabel.text = @"肉山大魔王";
        self.authorLabel.textColor = [UIColor lightGrayColor];
        self.authorLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.authorLabel];

        _loveCountLabel = [[UILabel alloc] init];
        self.loveCountLabel.text = @"1025";
        self.loveCountLabel.textColor = [UIColor lightGrayColor];
        self.loveCountLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.loveCountLabel];

        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{
    double height = [UIScreen mainScreen].bounds.size.width * 0.46;
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(24);
        make.left.mas_equalTo(self.contentView).offset(16);
        make.right.mas_equalTo(self.contentView).mas_equalTo(-16);
        make.height.mas_equalTo(height);
    }];
    [self.filmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.headerImageView.mas_centerX);
        make.bottom.mas_equalTo(self.headerImageView.mas_bottom).offset(-20);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerImageView.mas_bottom).offset(20);
        make.left.mas_equalTo(self.headerImageView.mas_left).offset(12);
        make.right.mas_equalTo(self.headerImageView.mas_right).offset(-12);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(self.headerImageView).offset(12);
        make.right.mas_equalTo(self.headerImageView).offset(-12);
    }];

    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.descLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(self.headerImageView).offset(12);
        make.bottom.mas_equalTo(self.contentView).offset(-12);
    }];
    [self.loveCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.descLabel.mas_bottom).offset(20);
        make.right.mas_equalTo(self.headerImageView).offset(-12);
    }];
}

-(void)setLineSpace:(CGFloat)lineSpace withText:(NSString *)text inLabel:(UILabel *)label{
    if (!text || !label) {
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace;  //设置行间距
    paragraphStyle.lineBreakMode = label.lineBreakMode;
    paragraphStyle.alignment = label.textAlignment;

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    label.attributedText = attributedString;
}
@end