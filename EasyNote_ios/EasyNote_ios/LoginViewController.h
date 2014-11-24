//
//  ViewController.h
//  EasyNote_ios
//
//  Created by shenqi329 on 14/11/15.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) IBOutlet UIButton *registerBtn;

@end

