//
// Created by jiyou xu on 2019-01-12.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString *const TU_WEN_CELL_REUSE_IDENTIFIER = @"tuWenCell";

@interface TuWenCell : UICollectionViewCell
- (void)setImageUrl:(NSString *)imageUrl andName:(NSString *)name;
@end