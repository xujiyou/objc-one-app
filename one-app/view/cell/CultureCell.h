//
// Created by jiyou xu on 2019-01-12.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString *const CULTURE_CELL_REUSE_IDENTIFIER = @"cultureCell";

@interface CultureCell : UITableViewCell
- (void)setImageUrl:(NSString *)imageUrl andTitle:(NSString *)title andDesc:(NSString *)desc;
@end