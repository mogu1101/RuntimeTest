//
//  ViewController.m
//  RuntimeTest
//
//  Created by LiuJinjun on 16/8/11.
//  Copyright © 2016年 NetEase Youdao. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Gesture.h"
//#import "UIViewController+Tracking.h"

@interface ViewController ()

@end

@implementation ViewController

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:YES];
//    NSLog(@"test");
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor lightGrayColor];
    [view setTapGestureActionWithBlock:^{
        NSLog(@"点击view");
        ViewController *vc = [[ViewController alloc] init];
        vc.view.backgroundColor = [UIColor yellowColor];
        [self showViewController:vc sender:self];
    }];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
