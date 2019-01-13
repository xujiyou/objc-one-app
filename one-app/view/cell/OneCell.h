//
// Created by jiyou xu on 2019-01-06.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Article.h"

static NSString *const ONE_CELL_REUSE_IDENTIFIER = @"oneCell";

@interface OneCell : UITableViewCell

@property (strong, nonatomic) Article *article;
@end