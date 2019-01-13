//
// Created by jiyou xu on 2019-01-09.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Article;

static NSString *const ARTICLE_HEADER_CELL_REUSE_IDENTIFIER = @"articleHeaderCell";

@interface ArticleHeaderCell : UITableViewCell
@property (nonatomic, strong) Article *article;
@end