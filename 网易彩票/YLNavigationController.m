//
//  YLNavigationController.m
//  网易彩票
//
//  Created by Yuri on 15/10/29.
//  Copyright © 2015年 Yuri. All rights reserved.
//

#import "YLNavigationController.h"

@interface YLNavigationController ()

@end

@implementation YLNavigationController

//在第一次使用该类的时候 调用该方法
+ (void)initialize{
    if(self == [YLNavigationController class]){
        
        //设置 导航器背景颜色
        UINavigationBar *nav = [UINavigationBar appearanceWhenContainedIn:self, nil];
        [nav setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
 
        //设置 导航器标题颜色
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
        dict[NSFontAttributeName] = [UIFont fontWithName:@"Menlo-bold" size:20];
        
        [nav setTitleTextAttributes:dict];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
