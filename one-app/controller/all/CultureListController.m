//
// Created by jiyou xu on 2019-01-11.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "CultureListController.h"
#import "Masonry.h"
#import "CultureCell.h"

@interface CultureListController() <UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation CultureListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"文化";
    self.view.backgroundColor = [UIColor whiteColor];

    _tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //设置不显示分割线
    self.tableView.rowHeight = UITableViewAutomaticDimension; //设置高度动态改变
    self.tableView.estimatedRowHeight = 100; //设置一个预估高度
    [self.tableView registerClass:[CultureCell class] forCellReuseIdentifier:CULTURE_CELL_REUSE_IDENTIFIER];

    [self.view addSubview:self.tableView];

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CultureCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CULTURE_CELL_REUSE_IDENTIFIER];
    [cell setImageUrl:@"http://pics.vidovision.com/5c04d11e6b56306696f8cd48" andTitle:@"明知道做的是杯水车薪的事，为什么还要义无反顾的去做" andDesc:@"人活一世，不就是一场空吗"];
    return cell;
}

@end