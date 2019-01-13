//
// Created by jiyou xu on 2019-01-06.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <CloudKit/CloudKit.h>
#import "Article.h"


@implementation Article {

}

- (id)initWithType:(NSString *)type title:(NSString *)title author:(NSString *)author desc:(NSString *)desc date:(NSString *)date loveCount:(int) loveCount{
    if (self = [super init]) {
        _type = type;
        _title = title;
        _author = author;
        _desc = desc;
        _date = date;
        _loveCount = loveCount;
    }
    return self;
}
@end