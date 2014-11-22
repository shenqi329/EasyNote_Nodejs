//
//  ENRegisterRequest.m
//  EasyNote_ios
//
//  Created by shenqi329 on 14/11/15.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "ENRegisterRequest.h"

@implementation ENRegisterRequest

- (id)initPostRequestWithUsername:(NSString*)username password:(NSString*)password
{
    NSDictionary *dic = @{@"name":username,@"password":password};
    //NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:username,@"name",password,@"password", nil]
    if (self = [super initWithUrl:@"/reg" formValue:dic method:@"GET"]) {
        
    }
    return self;
}

@end
