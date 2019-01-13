//
// Created by jiyou xu on 2019-01-06.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "AllController.h"
#import "Masonry.h"
#import "ClassifyView.h"
#import "SpecialView.h"
#import "HotAuthorView.h"
#import "FilmPageController.h"

@interface AllController()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) ClassifyView *classifyView;
@property (nonatomic, strong) SpecialView *specialView;
@property (nonatomic, strong) HotAuthorView *hotAuthorView;
@end

@implementation AllController

- (id) init{
    if (self = [super init]) {
        _scrollView = [[UIScrollView alloc] init];
        _containerView = [[UIView alloc] init];
        _classifyView = [[ClassifyView alloc] init];
        _specialView = [[SpecialView alloc] init];
        _hotAuthorView = [[HotAuthorView alloc] init];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.containerView];
    self.classifyView.navigationController = self.navigationController;
    [self.containerView addSubview:self.classifyView];
    [self.specialView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSpecialView:)]];
    [self.containerView addSubview:self.specialView];
    self.hotAuthorView.navigationController = self.navigationController;
    [self.containerView addSubview:self.hotAuthorView];
    [self settingLayout];
}

- (void)settingLayout{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.bottom.equalTo(self.hotAuthorView.mas_bottom);
    }];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.scrollView);
        make.top.mas_equalTo(self.scrollView);
    }];
    [self.classifyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.containerView.mas_top);
        make.left.right.mas_equalTo(self.containerView);
    }];

    [self.specialView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.classifyView.mas_bottom);
        make.left.right.mas_equalTo(self.containerView);
    }];

    [self.hotAuthorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.specialView.mas_bottom);
        make.left.right.mas_equalTo(self.containerView);
    }];

    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.hotAuthorView.mas_bottom);
    }];
}

- (void)tapSpecialView:(id)tapSpecialView {
    [self.navigationController pushViewController:[[FilmPageController alloc] init] animated:true];
}
@end
