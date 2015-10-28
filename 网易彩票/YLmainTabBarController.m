//
//  YLmainTabBarController.m
//  网易彩票
//
//  Created by Yuri on 15/10/28.
//  Copyright © 2015年 Yuri. All rights reserved.
//

#import "YLmainTabBarController.h"
#import "YLNavigationController.h"
#import "YLTabBar.h"

#import "YLloginViewController.h"
#import "YLAwardController.h"
#import "YLDiscoverController.h"
#import "YLFunBuyViewController.h"
#import "YLHallViewController.h"


@interface YLmainTabBarController () <YLTabBarDelegate>

/**    数组 接收item传给目标自定义tabbar中的数组*/
@property (nonatomic, strong) NSMutableArray *items;


@end
@implementation YLmainTabBarController 

- (NSMutableArray *)items{
    if(!_items){
        _items = [NSMutableArray array];
    }
    return  _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpChindControllers];
    [self setUpTabBar];
    
    
}

- (void)setUpTabBar{
    [self.tabBar removeFromSuperview];
    
    YLTabBar *bar = [[YLTabBar alloc]init];
    bar.items = self.items;
    
    bar.backgroundColor = [UIColor blackColor];
    bar.delegate = self;
    bar.frame = self.tabBar.frame;
    [self.view addSubview:bar];
}

- (void)tabBar:(YLTabBar *)tabBar withIndex:(NSInteger)index{
    // 切换控制器
    self.selectedIndex = index;
}


- (void)setUpChindControllers{
    //购彩大厅
    YLHallViewController *hall = [[YLHallViewController alloc]init];
    [self addrootViewController:hall withImage:[UIImage imageNamed:@"TabBar_LotteryHall"] WithSelImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected"] withTite:@"购彩大厅"];
    
    //欢乐购
    YLFunBuyViewController *funBuy = [[YLFunBuyViewController alloc]init];
    [self addrootViewController:funBuy withImage:[UIImage imageNamed:@"TabBar_HYG"] WithSelImage:[UIImage imageNamed:@"TabBar_HYG_selected"] withTite:@"欢乐购"];
    
    //发现
    YLDiscoverController *discover = [[YLDiscoverController alloc]init];
    [self addrootViewController:discover withImage:[UIImage imageNamed:@"TabBar_Discovery"] WithSelImage:[UIImage imageNamed:@"TabBar_Discovery_selected"] withTite:@"发现"];
    
    //开奖信息
    YLAwardController *Award  = [[YLAwardController alloc]init];
    [self addrootViewController:Award withImage:[UIImage imageNamed:@"TabBar_History"] WithSelImage:[UIImage imageNamed:@"TabBar_History_selected"] withTite:@"开奖信息"];
    
    //我的彩票
    YLloginViewController *MyLottery = [[YLloginViewController alloc]init];
    [self addrootViewController:MyLottery withImage:[UIImage imageNamed:@"TabBar_MyLottery"] WithSelImage:[UIImage imageNamed:@"TabBar_MyLottery_selected"] withTite:@"我的彩票"];
    
}

- (void)addrootViewController:(UIViewController *)vc withImage:(UIImage *)image WithSelImage:(UIImage *)SelImage withTite:(NSString *)title{
    
    YLNavigationController *nav = [[YLNavigationController alloc]initWithRootViewController:vc];

 
    nav.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [SelImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    [self.items addObject:nav.tabBarItem];

//    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    //设置 没问题 下面两种
//    nav.navigationBar.topItem.title = title;
//    vc.navigationItem.title = title;

    vc.title = title;
    [self addChildViewController:nav];
}

@end
