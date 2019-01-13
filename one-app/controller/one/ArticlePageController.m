//
// Created by jiyou xu on 2019-01-08.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "ArticlePageController.h"
#import "Masonry.h"
#import "ArticleHeaderCell.h"
#import "ArticleCommentCell.h"

@interface ArticlePageController() <UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ArticlePageController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"ONE STORY"; //设置导航栏标题
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self; //设置数据代理
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //设置不显示分割线
    self.tableView.rowHeight = UITableViewAutomaticDimension; //设置高度动态改变
    self.tableView.estimatedRowHeight = 300; //设置一个预估高度
    [self.tableView registerClass:[ArticleHeaderCell class] forCellReuseIdentifier:ARTICLE_HEADER_CELL_REUSE_IDENTIFIER]; //注册CELL
    [self.tableView registerClass:[ArticleCommentCell class] forCellReuseIdentifier:ARTICLE_COMMENT_REUSE_IDENTIFIER]; //注册CELL

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
        ArticleHeaderCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ARTICLE_HEADER_CELL_REUSE_IDENTIFIER];
        cell.article = self.article;
        return cell;
    } else {
        ArticleCommentCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ARTICLE_COMMENT_REUSE_IDENTIFIER];
        return cell;
    }
}


@end