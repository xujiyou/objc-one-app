//
// Created by jiyou xu on 2019-01-12.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "MyFollowPageController.h"
#import "Masonry.h"
#import "FollowUserCell.h"

@interface MyFollowPageController()<UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@end


@implementation MyFollowPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的关注";

    _tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self; //设置数据代理
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //设置不显示分割线
    self.tableView.rowHeight = UITableViewAutomaticDimension; //设置高度动态改变
    self.tableView.estimatedRowHeight = 100; //设置一个预估高度
    [self.tableView registerClass:[FollowUserCell class] forCellReuseIdentifier:FOLLOW_USER_CELL_REUSE_IDENTIFIER]; //注册CELL

    [self.view addSubview:self.tableView];

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FollowUserCell *followUserCell = [self.tableView dequeueReusableCellWithIdentifier:FOLLOW_USER_CELL_REUSE_IDENTIFIER];
    return followUserCell;
}

-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound)
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    [super viewWillDisappear:animated];
}

@end

