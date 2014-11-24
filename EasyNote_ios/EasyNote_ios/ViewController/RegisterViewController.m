//
//  RegisterViewController.m
//  EasyNote_ios
//
//  Created by shenqi329 on 14/11/22.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "RegisterViewController.h"
#import "ENRegisterRequest.h"
#import "SWToast.h"

@interface RegisterViewController ()

@property (strong, nonatomic) IBOutlet UIButton *registerBtn;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *password1;


@property (strong,nonatomic) ENRegisterRequest *registerRequest;

@end

@implementation RegisterViewController

- (IBAction)resigterBtnClick:(id)sender {
    
    if (![self.password.text isEqualToString:self.password1.text]) {
        [SWToast makeToast:@"两次输入的密码不一致"];
        return;
    }
    if (self.username.text.length < 8 || self.password.text.length < 8 ) {
        [SWToast makeToast:@"输入不合法"];
        return;
    }
         
    [self.registerRequest clearDelegatesAndCancel];
    self.registerRequest = [[ENRegisterRequest alloc] initPostRequestWithUsername:self.username.text password:self.password.text];
    
    [self.registerRequest startAsynchronous];
    __weak RegisterViewController *weakSelf = self;
    [self.registerRequest setCompletionBlock:^{
        
        ENRegisterDataResponsePost *data = (ENRegisterDataResponsePost*)[weakSelf.registerRequest responseStringToObject];
        if (data.isSuccess) {
            if([data.data.exist intValue] == 1){
                [SWToast makeToast:@"用户名已经存在"];
            }else{
                [SWToast makeToast:@"注册成功"];
            }
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
