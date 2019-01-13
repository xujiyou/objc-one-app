//
// Created by jiyou xu on 2019-01-12.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "TuWenCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface TuWenCell()
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *nameLabel;
@end

@implementation TuWenCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:self.imageView];

        _nameLabel = [[UILabel alloc] init];
        self.nameLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:self.nameLabel];

        [self settingLayout];
    }
    return self;
}

- (void)settingLayout{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-40);
    }];

    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self.mas_bottom).offset(-20);
    }];
}

- (void)setImageUrl:(NSString *)imageUrl andName:(NSString *)name{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"4"]];
    self.nameLabel.text = name;
}
@end