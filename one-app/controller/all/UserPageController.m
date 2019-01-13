//
// Created by jiyou xu on 2019-01-12.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "UserPageController.h"
#import "Masonry.h"
#import "OneCell.h"
#import "UserDetailCell.h"

@interface UserPageController() <UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@end


@implementation UserPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self; //设置数据代理
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //设置不显示分割线
    self.tableView.rowHeight = UITableViewAutomaticDimension; //设置高度动态改变
    self.tableView.estimatedRowHeight = 100; //设置一个预估高度
    [self.tableView registerClass:[OneCell class] forCellReuseIdentifier:ONE_CELL_REUSE_IDENTIFIER]; //注册CELL
    [self.tableView registerClass:[UserDetailCell class] forCellReuseIdentifier:USER_DETAIL_CELL_REUSE_IDENTIFIER]; //注册CELL

    [self.view addSubview:self.tableView];

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UserDetailCell *cell = [self.tableView dequeueReusableCellWithIdentifier:USER_DETAIL_CELL_REUSE_IDENTIFIER];
        return cell;
    } else {
        OneCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ONE_CELL_REUSE_IDENTIFIER];
        Article *article = [[Article alloc] initWithType:@"--· 问答 ·--" title:@"新的一年，你有哪些感悟可以和我们分享？" author:@"文 / 卫天成" desc:@"辞旧迎新，就特别喜欢看大家的新年总结，觉得能在他人的感悟里观照自己，收获很多。新的一年，自己也快迈入30岁，也想听过来人分享一下他们的感想。" date:@"今天" loveCount:3000];
        cell.article = article;
        return cell;
    }
}

@end