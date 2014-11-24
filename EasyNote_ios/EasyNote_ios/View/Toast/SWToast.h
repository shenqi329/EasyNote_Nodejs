//
//  SWToast.h
//  ChildGuard
//
//  Created by shenqi329 on 14/10/30.
//  Copyright (c) 2014年 eebbk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SWToast : NSObject

+ (void)makeToast:(NSString *)message;
+ (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position;
+ (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title;
+ (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position title:(NSString *)title image:(UIImage *)image;
+ (void)makeToast:(NSString *)message duration:(CGFloat)interval position:(id)position image:(UIImage *)image;

// displays toast with an activity spinner
+ (void)makeToastActivity;
+ (void)makeToastActivity:(id)position;
+ (void)hideToastActivity;

// the showToast methods display any view as toast
+ (void)showToast:(UIView *)toast;
+ (void)showToast:(UIView *)toast duration:(CGFloat)interval position:(id)point;

@end
