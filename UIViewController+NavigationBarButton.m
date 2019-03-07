//
//  UIViewController+NavigationBarButton.m
//  TestNaviBarButton
//
//  Created by cgw on 2019/2/14.
//  Copyright © 2019 bill. All rights reserved.
//

#import "UIViewController+NavigationBarButton.h"

static CGFloat const gButtonSizeWidth = 80;
static CGFloat const gButtonSizeHeight = 40;

@implementation UIViewController (NavigationBarButton)

- (void)addLeftBarItemWithAction:(SEL)action title:(NSString *)title{
    [self addLeftBarItemWithAction:action title:title font:[UIFont systemFontOfSize:14] textColor:[UIColor whiteColor] alignment:NSTextAlignmentLeft toLeft:-5];
}

- (void)addLeftBarItemWithAction:(SEL)action title:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor alignment:(NSTextAlignment)alignment toLeft:(CGFloat)toLeft{
    UIBarButtonItem *btnItem =
    [self barItemWithTitle:title normalImgName:nil hightLightImgName:nil selectImgName:nil target:self action:action titleFont:font titleColor:textColor textAlignmnet:alignment size:CGSizeMake(gButtonSizeWidth, gButtonSizeHeight)];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = toLeft;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,btnItem];
}

- (UIButton *)getLeftBarItemCustomView{
    NSArray *items = self.navigationItem.leftBarButtonItems;
    if( items.count > 1 ){
        UIBarButtonItem *item = items[1];
        if( [item.customView isKindOfClass:[UIButton class]] ){
            return item.customView;
        }
    }
    
    return nil;
}

#pragma mark - Private
- (UIBarButtonItem *)barItemWithTitle:(NSString *)title
                        normalImgName:(NSString *)nImgName
                    hightLightImgName:(NSString *)hImgName
                        selectImgName:(NSString*)sImgName
                               target:(id)target action:(SEL)action
                            titleFont:(UIFont*)titleFont
                           titleColor:(UIColor*)titleColor
                        textAlignmnet:(NSTextAlignment)alignment
                                 size:(CGSize)size
{
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(0, 0, size.width, size.height);
    
    [button setImage:[UIImage imageNamed:nImgName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hImgName] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:sImgName] forState:UIControlStateSelected];

    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateDisabled];
    [button.titleLabel setFont:titleFont];
    
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    if( [target respondsToSelector:action] ){
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
