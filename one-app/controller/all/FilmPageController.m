//
// Created by jiyou xu on 2019-01-12.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "FilmPageController.h"
#import "Masonry.h"
#import "FilmCell.h"

@interface FilmPageController() <UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@end


@implementation FilmPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"追剧";
    self.view.backgroundColor = [[UIColor alloc] initWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1.0];

    _tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [[UIColor alloc] initWithRed:(CGFloat) (244 / 255.0) green:(CGFloat) (244 / 255.0) blue:(CGFloat) (244 / 255.0) alpha:1.0];
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //设置不显示分割线
    self.tableView.rowHeight = UITableViewAutomaticDimension; //设置高度动态改变
    self.tableView.estimatedRowHeight = 360; //设置一个预估高度
    [self.tableView registerClass:[FilmCell class] forCellReuseIdentifier:FILM_CELL_REUSE_IDENTIFIER];

    [self.view addSubview:self.tableView];

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FilmCell *filmCell = [self.tableView dequeueReusableCellWithIdentifier:FILM_CELL_REUSE_IDENTIFIER];
    return filmCell;
}

@end