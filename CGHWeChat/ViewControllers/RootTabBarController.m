//
//  RootTabBarController.m
//  CGHWeChat
//
//  Created by caigehui on 4/4/16.
//  Copyright © 2016 caigehui. All rights reserved.
//

#import "RootTabBarController.h"
#import "ColorConfig.h"
#import "BaseNavigationController.h"
#import "ChatTableViewController.h"
@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.tabBar.tintColor = GREEN_COLOR;
    self.tabBar.backgroundColor = TABBAR_COLOR;
    
    [self addChildViewController];
}

- (void)viewWillAppear:(BOOL)animated
{
    //改变StatusBar颜色
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

- (void)addChildViewController
{
    NSMutableArray *childsArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    ChatTableViewController *chatVC = [[ChatTableViewController alloc] init];
    [chatVC.tabBarItem setTitle:@"微信"];
    [chatVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_mainframe"]];
    [chatVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_mainframeHL"]];
    BaseNavigationController *chatNVC = [[BaseNavigationController alloc] initWithRootViewController:chatVC];
    [childsArray addObject:chatNVC];
    
    
    UIViewController *contactsVC = [[UIViewController alloc] init];
    [contactsVC.tabBarItem setTitle:@"通讯录"];
    [contactsVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_contacts"]];
    [contactsVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_contactsHL"]];
    BaseNavigationController *contactsNVC = [[BaseNavigationController alloc] initWithRootViewController:contactsVC];
    [childsArray addObject:contactsNVC];
    
    UIViewController *discoverVC = [[UIViewController alloc] init];
    [discoverVC.tabBarItem setTitle:@"发现"];
    [discoverVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_discover"]];
    [discoverVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_discoverHL"]];
    BaseNavigationController *discoverNavC = [[BaseNavigationController alloc] initWithRootViewController:discoverVC];
    [childsArray addObject:discoverNavC];
    
    UIViewController *meVC = [[UIViewController alloc] init];
    [meVC.tabBarItem setTitle:@"我"];
    [meVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_me"]];
    [meVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_meHL"]];
    BaseNavigationController *meNVC = [[BaseNavigationController alloc] initWithRootViewController:meVC];
    [childsArray addObject:meNVC];
    
    [self setViewControllers:childsArray];

}

@end
