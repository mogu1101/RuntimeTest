//
//  UIView+Gesture.h
//  RuntimeTest
//
//  Created by LiuJinjun on 16/8/11.
//  Copyright © 2016年 NetEase Youdao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Gesture)

- (void)setTapGestureActionWithBlock:(void(^)())block;

@end
