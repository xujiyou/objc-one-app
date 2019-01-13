//
// Created by jiyou xu on 2019-01-06.
// Copyright (c) 2019 xujiyou. All rights reserved.
//

#import "MainViewController.h"
#import "OneController.h"
#import "AllController.h"
#import "MeController.h"

@interface MainViewController() <UITabBarControllerDelegate>

@end

@implementation MainViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]]; //设置导航栏背景颜色
    [[UITabBar appearance] setTranslucent:NO];
    self.navigationItem.title = @"ONE"; //设置导航栏标题
    self.delegate = self;
    self.edgesForExtendedLayout = UIRectEdgeNone;//设置tableView不被导航栏挡住
    self.view.translatesAutoresizingMaskIntoConstraints = NO; //使用autoLayout
    [self loadViewControllers];
}

- (void)loadViewControllers {
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor], NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:12.0f]} forState:UIControlStateSelected];

    OneController *oneController = [[OneController alloc] init];
    UITabBarItem *oneItem = [[UITabBarItem alloc] initWithTitle:@"ONE" image:[UIImage imageNamed:@"icons8-推特-30"] selectedImage:[UIImage imageNamed:@"icons8-推特-filled-30"]];
    oneController.tabBarItem = oneItem;

    AllController *allController = [[AllController alloc] init];
    allController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"ALL" image:[UIImage imageNamed:@"icons8-例-30"] selectedImage:[UIImage imageNamed:@"icons8-例-filled-30"]];

    MeController *meController = [[MeController alloc] init];
    meController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"ME" image:[UIImage imageNamed:@"icons8-联系人-30"] selectedImage:[UIImage imageNamed:@"icons8-联系人-filled-30"]];
    [self setViewControllers:@[oneController, allController, meController] animated:YES];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[OneController class]]) {
        self.navigationItem.title = @"ONE"; //设置导航栏标题
        [self.navigationController setNavigationBarHidden:NO animated:NO];
    } else if ([viewController isKindOfClass:[AllController class]]) {
        self.navigationItem.title = @"ALL"; //设置导航栏标题
        [self.navigationController setNavigationBarHidden:NO animated:NO];
    } else if ([viewController isKindOfClass:[MeController class]]) {
        self.navigationItem.title = @"ME"; //设置导航栏标题
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    }
}
@end