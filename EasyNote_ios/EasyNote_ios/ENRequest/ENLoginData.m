//
//  ENLoginData.m
//  EasyNote_ios
//
//  Created by shenqi329 on 14/11/22.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "ENLoginData.h"


@implementation ENLoginForm

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    return [super initWithDictionary:dictionary];
}

@end

@implementation ENLoginDataResponsePost

+ (id)data_class
{
    return [ENLoginForm class];
}

@end
