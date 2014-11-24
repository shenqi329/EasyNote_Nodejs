//
//  ViewController.m
//  EasyNote_ios
//
//  Created by shenqi329 on 14/11/15.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "LoginViewController.h"
#import "ENRegisterRequest.h"
#import "ENLoginRequest.h"
#import "SWToast.h"

@interface LoginViewController ()

@property(nonatomic,retain) ENLoginRequest *loginRequest;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnClick:(id)sender {
    
    if (self.username.text.length <= 0) {
        [SWToast makeToast:@"用户名格式不合法"];
        return;
    }
    if (self.password.text.length <= 0) {
        [SWToast makeToast:@"密码格式不合法"];
        return;
    }
    
    [self.loginRequest clearDelegatesAndCancel];
    self.loginRequest = [[ENLoginRequest alloc] initPostRequestWithUsername:self.username.text password:self.password.text];
    [self.loginRequest startAsynchronous];
    __weak LoginViewController *weakSelf = self;
    [self.loginRequest setCompletionBlock:^{
       
        ENLoginDataResponsePost *data = (ENLoginDataResponsePost*)[weakSelf.loginRequest responseStringToObject];
        if (data.isSuccess) {
            if ([data.data.exist intValue] == 1 ) {
                UIViewController *controller = [weakSelf.storyboard instantiateViewControllerWithIdentifier:@"HomePageViewController"];
                [weakSelf.navigationController pushViewController:controller animated:YES];
            }else{
                [SWToast makeToast:@"用户名或密码错误"];
            }
        }
        
    }];
}

@end
