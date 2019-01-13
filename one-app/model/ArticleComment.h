//
// Created by jiyou xu on 2019-01-09.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ArticleComment : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) int loveCount;
@end