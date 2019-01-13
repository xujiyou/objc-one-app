//
// Created by jiyou xu on 2019-01-09.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "ArticleCommentCell.h"

@implementation ArticleCommentCell {
    UILabel *nameLabel;
    UILabel *dateLabel;
    UILabel *contentLabel;
    UILabel *loveCountLabel;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        nameLabel = [[UILabel alloc] init];
        nameLabel.text = @"臭宝宝";
        nameLabel.font = [UIFont systemFontOfSize:12];
        nameLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:nameLabel];

        dateLabel = [[UILabel alloc] init];
        dateLabel.text = @"2019.01.08 07:31";
        dateLabel.font = [UIFont systemFontOfSize:12];
        dateLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:dateLabel];

        contentLabel = [[UILabel alloc] init];
        NSString *content = @"不到最后一天，你永远不知道谁是年度最大烂片。相信大家在2018，没少遭受各路烂片的花式摧残。";
        contentLabel.text = content;
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.textColor = [UIColor darkGrayColor];
        [self setLineSpace:6.0f withText:content inLabel:contentLabel];
        [self.contentView addSubview:contentLabel];

        loveCountLabel = [[UILabel alloc] init];
        loveCountLabel.text = @"34";
        loveCountLabel.font = [UIFont systemFontOfSize:12];
        loveCountLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:loveCountLabel];

        [self settingLayout];
    }
    return self;
}

-(void) settingLayout{
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(16);
        make.left.mas_equalTo(self.contentView).offset(16);
    }];
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.mas_equalTo(self.contentView).offset(16);
         make.right.mas_equalTo(self.contentView).offset(-16);
    }];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameLabel.mas_bottom).offset(20);
        make.left.mas_equalTo(self.contentView).offset(36);
        make.right.mas_equalTo(self.contentView).offset(-16);
    }];
    [loveCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(contentLabel.mas_bottom).offset(20);
        make.right.mas_equalTo(self.contentView).offset(-16);
    }];

    UIView *divideView = [[UILabel alloc] init];
    divideView.backgroundColor = [UIColor colorWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1];;
    [self.contentView addSubview:divideView];
    [divideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loveCountLabel.mas_bottom).offset(16);
        make.left.mas_equalTo(self.contentView).offset(16);
        make.right.mas_equalTo(self.contentView).offset(-16);
        make.height.mas_equalTo(1);
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

@end