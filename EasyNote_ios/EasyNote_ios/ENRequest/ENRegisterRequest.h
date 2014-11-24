//
//  ENRegisterRequest.h
//  EasyNote_ios
//
//  Created by shenqi329 on 14/11/15.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "EasyNoteRequest.h"
#import "ENRegisterData.h"

@interface ENRegisterRequest : EasyNoteRequest

- (id)initPostRequestWithUsername:(NSString*)userName password:(NSString*)passWord;

@end
