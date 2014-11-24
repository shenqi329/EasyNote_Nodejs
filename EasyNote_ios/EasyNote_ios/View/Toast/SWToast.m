//
//  SWToast.m
//  ChildGuard
//
//  Created by shenqi329 on 14/10/30.
//  Copyright (c) 2014年 eebbk. All rights reserved.
//

#import "SWToast.h"
#import "Toast+UIView.h"

@implementation SWToast

+ (void)makeToast:(NSString *)message
{
    [SWToast makeToast:message duration:2.0 position:@"bottom"];
}

+ (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window makeToast:message duration:interval position:position];
}

+ (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window makeToast:message duration:interval position:position title:title];
}
+ (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title image:(UIImage *)image
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window makeToast:message duration:interval position:position title:title image:image];
}
+ (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position image:(UIImage *)image
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window makeToast:message duration:interval position:position image:image];
}

// displays toast with an activity spinner
+ (void)makeToastActivity
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window makeToastActivity];
}

+ (void)makeToastActivity:(id)position
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window makeToastActivity:position];
}

+ (void)hideToastActivity
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window hideToastActivity];
}

// the showToast methods display any view as toast
+ (void)showToast:(UIView *)toast
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window showToast:toast];
}

+ (void)showToast:(UIView *)toast duration:(CGFloat)interval position:(id)point
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window showToast:toast duration:interval position:point];
}

@end
