//
//  UIViewController+NavigationBarButton.h
//  TestNaviBarButton
//
//  Created by cgw on 2019/2/14.
//  Copyright © 2019 bill. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (NavigationBarButton)

/**
 添加导航栏左侧按钮
 */
- (void)addLeftBarItemWithAction:(SEL)action
                           title:(NSString*)title;
- (void)addLeftBarItemWithAction:(SEL)action
                           title:(NSString *)title
                            font:(UIFont*)font
                       textColor:(UIColor*)textColor
                       alignment:(NSTextAlignment)alignment;

- (UIButton*)getLeftBarItemCustomView;

@end

NS_ASSUME_NONNULL_END
