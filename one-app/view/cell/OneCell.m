//
// Created by jiyou xu on 2019-01-06.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "OneCell.h"
#import "Masonry.h"


@implementation OneCell {
    UILabel *typeLabel;
    UILabel *titleLabel;
    UILabel *authorLabel;
    UILabel *descLabel;
    UILabel *dateLabel;
    UILabel *loveCountLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        typeLabel = [[UILabel alloc] init];
        typeLabel.font = [UIFont systemFontOfSize:10];
        typeLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:typeLabel];

        titleLabel = [[UILabel alloc] init];
        titleLabel.numberOfLines = 0;
        [self.contentView addSubview:titleLabel];

        authorLabel = [[UILabel alloc] init];
        authorLabel.font = [UIFont systemFontOfSize:10];
        authorLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:authorLabel];

        descLabel = [[UILabel alloc] init];
        descLabel.numberOfLines = 0;
        descLabel.font = [UIFont systemFontOfSize:14];
        descLabel.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:descLabel];

        dateLabel = [[UILabel alloc] init];
        dateLabel.font = [UIFont systemFontOfSize:10];
        dateLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:dateLabel];

        loveCountLabel = [[UILabel alloc] init];
        loveCountLabel.font = [UIFont systemFontOfSize:10];
        loveCountLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:loveCountLabel];
        [self settingLayout];
    }
    return self;
}

- (void)settingLayout {
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(self.contentView.mas_top).offset(10);
       make.centerX.mas_equalTo(self.contentView.mas_centerX);
    }];

    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(typeLabel.mas_bottom).offset(16);
       make.left.mas_equalTo(self.contentView.mas_left).offset(16);
       make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
    }];

    [authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(titleLabel.mas_bottom).offset(16);
       make.left.mas_equalTo(self.contentView.mas_left).offset(16);
       make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
    }];

    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(authorLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(self.contentView.mas_left).offset(16);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
    }];

    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(descLabel.mas_bottom).offset(32);
       make.left.mas_equalTo(self.contentView.mas_left).offset(16);
    }];

    [loveCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(descLabel.mas_bottom).offset(32);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];

    UIView *divideView = [[UILabel alloc] init];
    divideView.backgroundColor = [UIColor colorWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1];;
    [self.contentView addSubview:divideView];
    [divideView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(dateLabel.mas_bottom).offset(10);
       make.width.mas_equalTo(self.contentView.mas_width);
       make.height.mas_equalTo(6);
       make.bottom.mas_equalTo(self.contentView.mas_bottom);
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

- (void)setArticle:(Article *)article {
    _article = article;
    typeLabel.text = article.type;
    titleLabel.text = article.title;
    authorLabel.text = article.author;
    descLabel.text = article.desc;
    [self setLineSpace:8.0f withText:article.desc inLabel:descLabel];
    dateLabel.text = article.date;
    loveCountLabel.text = [NSString stringWithFormat:@"赞: %d", article.loveCount];
}

@end