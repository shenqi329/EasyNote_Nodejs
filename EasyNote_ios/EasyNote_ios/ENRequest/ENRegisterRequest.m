//
//  ENRegisterRequest.m
//  EasyNote_ios
//
//  Created by shenqi329 on 14/11/15.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "ENRegisterRequest.h"

@implementation ENRegisterRequest

- (id)initPostRequestWithUsername:(NSString*)userName password:(NSString*)passWord
{
    NSDictionary *dic = @{@"name":userName,@"password":passWord};
    if (self = [super initWithUrl:@"/reg" formValue:dic method:@"POST"]) {
        
    }
    return self;
}

-(EasyNoteData*)responseStringToObject
{
    EasyNoteData *data = nil;
    NSDictionary *dic = [self responseStringToDictionary];
    
    if (self.isPost) {
        data = [[ENRegisterDataResponsePost alloc] initWithDictionary:dic];
    }
    
    return data;
}

@end
