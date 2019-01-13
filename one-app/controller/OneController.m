//
// Created by jiyou xu on 2019-01-06.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import <Masonry/View+MASAdditions.h>
#import "OneController.h"
#import "OneCell.h"
#import "ArticlePageController.h"

@interface OneController() <UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation OneController {
    NSArray<Article *> *articleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.setArrayData;

    _tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self; //设置数据代理
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //设置不显示分割线
    self.tableView.rowHeight = UITableViewAutomaticDimension; //设置高度动态改变
    self.tableView.estimatedRowHeight = 100; //设置一个预估高度
    [self.tableView registerClass:[OneCell class] forCellReuseIdentifier:ONE_CELL_REUSE_IDENTIFIER]; //注册CELL

    [self.view addSubview:self.tableView];

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OneCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ONE_CELL_REUSE_IDENTIFIER];
    cell.article = articleArray[(NSUInteger) indexPath.row];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCell:)];
    [cell addGestureRecognizer:tap];
    return cell;
}

- (void)tapCell:(UITapGestureRecognizer *)tapGestureRecognizer {
    OneCell *cell = (OneCell *)tapGestureRecognizer.view;
    ArticlePageController * articlePageController = [[ArticlePageController alloc] init];
    articlePageController.article = cell.article;
    [self.navigationController pushViewController:articlePageController animated:true];
}

- (void)setArrayData{
    articleArray = @[
            [[Article alloc] initWithType:@"--· 问答 ·--" title: @"情绪失控该怎么办?" author:@"文 / 大将军郭达" desc:@"允许事情更坏一点，并不是一种松懈和妥协，而是赋予自我一种弹性" date:@"今天" loveCount:663],
            [[Article alloc] initWithType:@"--· 小说 ·--" title:@"芬芳佳人" author:@"文 / 苦饮料" desc:@"他对身上每道伤口的由来都心知肚明。" date:@"昨天" loveCount:1200],
            [[Article alloc] initWithType:@"--· 问答 ·--" title:@"新的一年，你有哪些感悟可以和我们分享？" author:@"文 / 卫天成" desc:@"辞旧迎新，就特别喜欢看大家的新年总结，觉得能在他人的感悟里观照自己，收获很多。新的一年，自己也快迈入30岁，也想听过来人分享一下他们的感想。" date:@"今天" loveCount:3000],
            [[Article alloc] initWithType:@"--· 问答 ·--" title: @"情绪失控该怎么办?" author:@"文 / 大将军郭达" desc:@"允许事情更坏一点，并不是一种松懈和妥协，而是赋予自我一种弹性" date:@"今天" loveCount:663],
            [[Article alloc] initWithType:@"--· 小说 ·--" title:@"芬芳佳人" author:@"文 / 苦饮料" desc:@"他对身上每道伤口的由来都心知肚明。" date:@"昨天" loveCount:1200],
            [[Article alloc] initWithType:@"--· 问答 ·--" title:@"新的一年，你有哪些感悟可以和我们分享？" author:@"文 / 卫天成" desc:@"辞旧迎新，就特别喜欢看大家的新年总结，觉得能在他人的感悟里观照自己，收获很多。新的一年，自己也快迈入30岁，也想听过来人分享一下他们的感想。" date:@"今天" loveCount:3000]

    ];
}

@end