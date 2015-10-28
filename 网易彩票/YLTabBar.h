//
//  YLTabBar.h
//  网易彩票
//
//  Created by Yuri on 15/10/28.
//  Copyright © 2015年 Yuri. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YLTabBar;
@protocol YLTabBarDelegate <NSObject>

@optional
- (void)tabBar:(YLTabBar *)tabBar withIndex:(NSInteger)index;

@end

@interface YLTabBar : UIView

/**    items*/
@property (nonatomic, strong) NSArray  *items;
/**    Descripation*/
@property (nonatomic, weak) id<YLTabBarDelegate> delegate;

@end
