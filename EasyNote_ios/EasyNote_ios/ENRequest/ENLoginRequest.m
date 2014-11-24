//
//  ENLoginRequest.m
//  EasyNote_ios
//
//  Created by shenqi329 on 14/11/22.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "ENLoginRequest.h"

@implementation ENLoginRequest

- (id)initPostRequestWithUsername:(NSString*)userName password:(NSString*)passWord
{
    NSDictionary *dic = @{@"name":userName,@"password":passWord};
    if (self = [super initWithUrl:@"/login" formValue:dic method:@"POST"]) {
        
    }
    return self;
}

- (EasyNoteData*)responseStringToObject
{
    EasyNoteData *data = nil;
    NSDictionary *dic = [self responseStringToDictionary];
    
    if (self.isPost) {
        data = [[ENLoginDataResponsePost alloc] initWithDictionary:dic];
    }
    
    return data;
}

@end
