//
// Created by jiyou xu on 2019-01-06.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Article : NSObject

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, assign) int loveCount;

- (id)initWithType:(NSString *)type title:(NSString *)title author:(NSString *)author desc:(NSString *)desc date:(NSString *)date loveCount:(int) loveCount;
@end