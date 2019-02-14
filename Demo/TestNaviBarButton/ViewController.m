//
//  ViewController.m
//  TestNaviBarButton
//
//  Created by cgw on 2019/2/14.
//  Copyright © 2019 bill. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+NavigationBarButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
    [self addLeftBarItemWithAction:@selector(handleLeftItem) title:@"点我如何" font:[UIFont systemFontOfSize:16] textColor:[UIColor blackColor] alignment:NSTextAlignmentLeft];
}

- (void)handleLeftItem{
    NSLog(@"%s",__func__);
}

@end
