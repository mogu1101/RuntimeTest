//
//  UIView+Gesture.m
//  RuntimeTest
//
//  Created by LiuJinjun on 16/8/11.
//  Copyright © 2016年 NetEase Youdao. All rights reserved.
//

#import "UIView+Gesture.h"
#import <objc/runtime.h>

static const char *kActionHandlerTapGestureKey = "kActionHandlerTapGestureKey";
static const char *kActionHandlerTapBlockKey = "kActionHandlerTapBlockKey";

@implementation UIView (Gesture)

- (void)setTapGestureActionWithBlock:(void(^)())block {
    UITapGestureRecognizer *tapGesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
    if (!tapGesture) {
        tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionWithTapGesture:)];
        [self addGestureRecognizer:tapGesture];
        objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, tapGesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionWithTapGesture:(UITapGestureRecognizer *)tapGesture {
    if (tapGesture.state == UIGestureRecognizerStateRecognized) {
        void(^action)() = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey);
        if (action) {
            action();
        }
    }
}

@end
