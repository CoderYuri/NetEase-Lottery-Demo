//
//  YLTabBar.m
//  网易彩票
//
//  Created by Yuri on 15/10/28.
//  Copyright © 2015年 Yuri. All rights reserved.
//

#import "YLTabBar.h"
#import "YLtabButton.h"

@interface YLTabBar()

/**    <#Descripation#>*/
@property (nonatomic, weak) UIButton  *selectedBtn;

@end

@implementation YLTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setItems:(NSArray *)items{
    _items = items;
    
    for (int i = 0; i < items.count; i++) {
        UITabBarItem *item = items[i];
        
       
        /**
         *  自定义 按钮可以让按钮 长按的时候 仍然要处于被选中状态
         */
        YLtabButton *btn = [YLtabButton buttonWithType:UIButtonTypeCustom];
        //绑定 代理
         btn.tag = i;
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        
        if(i == 0){
            [self click:btn];
        }
    }
}

- (void)click:(UIButton *)btn{
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
    
    if([self.delegate respondsToSelector:@selector(tabBar:withIndex:)]){
        [_delegate tabBar:self withIndex:btn.tag];
    }
    
}

// 布局子控件的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnW = self.bounds.size.width / _items.count;
    NSLog(@"%@",NSStringFromCGRect(self.frame));
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    for (int i = 0; i < _items.count; i++) {
        
        UIButton *btn = self.subviews[i];
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}
               
@end
