//
// Created by jiyou xu on 2019-01-09.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "ArticleHeaderCell.h"
#import "Article.h"
#import "Masonry.h"


@implementation ArticleHeaderCell {
    UILabel *titleLabel;
    UILabel *authorLabel;
    UILabel *descLabel;
    UILabel *editLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        titleLabel = [[UILabel alloc] init];
        titleLabel.numberOfLines = 0;
        titleLabel.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:titleLabel];

        authorLabel = [[UILabel alloc] init];
        authorLabel.font = [UIFont systemFontOfSize:12];
        authorLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:authorLabel];

        descLabel = [[UILabel alloc] init];
        descLabel.numberOfLines = 0;
        descLabel.font = [UIFont systemFontOfSize:14];
        descLabel.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:descLabel];

        editLabel = [[UILabel alloc] init];
        editLabel.font = [UIFont systemFontOfSize:12];
        editLabel.textColor = [UIColor grayColor];
        editLabel.text = @"责任编辑：阿弗拉afra@wufazhuce.com";
        [self.contentView addSubview:editLabel];

        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{

    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(30);
        make.left.mas_equalTo(self.contentView.mas_left).offset(16);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
    }];

    [authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(40);
        make.left.mas_equalTo(self.contentView.mas_left).offset(16);
    }];

    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(authorLabel.mas_bottom).offset(40);
        make.left.mas_equalTo(self.contentView.mas_left).offset(16);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
    }];

    [editLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(descLabel.mas_bottom).offset(40);
        make.left.mas_equalTo(self.contentView.mas_left).offset(16);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-100);
    }];
}

- (void)setArticle:(Article *)article {
    _article = article;
    titleLabel.text = article.title;
    [self setLineSpace:8.0f withText:article.title inLabel:titleLabel];
    authorLabel.text = article.author;
    descLabel.text = article.desc;
    [self setLineSpace:12.0f withText:article.desc inLabel:descLabel];
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