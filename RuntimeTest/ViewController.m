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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    NSLog(@"test");
}

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
    
    // NSMutableArray Swizzling test
    NSString *s = nil;
    NSArray *array = @[@"123", @"tttt", s, @"321321"];
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
    [mArray addObject:nil];
    [mArray addObject:@"add Obj"];
    [mArray insertObject:@"test" atIndex:20];
    [mArray insertObject:nil atIndex:0];
    [mArray insertObject:@"insert Obj" atIndex:2];
    [mArray removeObjectAtIndex:80];
    [mArray removeObject:nil];
    [[NSMutableArray array] removeObjectAtIndex:0];
    [mArray objectAtIndex:30];
    NSLog(@"%@", [mArray objectAtIndex:0]);
    NSLog(@"%@", mArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
