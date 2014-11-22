//
//  SmartWatchRequest.m
//  ChildGuard
//
//  Created by shenqi329 on 14-10-7.
//  Copyright (c) 2014年 eebbk. All rights reserved.
//

#import "EasyNoteRequest.h"
#import "NSObject+SBJSON.h"
#import "NSString+SBJSON.h"


@implementation EasyNoteRequest

-(id)requestWithUrl:(NSString*)subUrl formValue:(NSDictionary*)formValue method:(NSString*)method
{
    return [self initWithUrl:subUrl formValue:formValue method:method];
}

/**
 *
 *
 *  @param subUrl    子路径,如 /contact 表示服务器接口的联系人
 *  @param formValue 表单数据 NSDictionary 或者 NSArray
 *  @param method    "POST" "GET" "PUT" "DELETE"
 *
 *  @return
 */
-(id)initWithUrl:(NSString*)subUrl formValue:(id)formValue method:(NSString*)method
{
    NSString *lasturl = [NSString stringWithFormat:@"http:localhost:3001%@",subUrl];
    if (self = [super initWithURL:[NSURL URLWithString:lasturl]]) {
        _subUrl = subUrl;
        _formValue = formValue;
        _method = method;
        
        if (formValue) {
            NSLog(@"%@",[self.formValue JSONFragment] );
            NSMutableData *tempPostData = [NSMutableData dataWithData:[[self.formValue JSONFragment] dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES]];
            
            [self setPostBody:tempPostData];
        }
        
        [self setRequestMethod:_method];
    }
    return self;
}

- (BOOL)isPost
{
    return [self.method isEqual:@"POST"];
}

- (BOOL)isPut
{
    return [self.method isEqual:@"PUT"];
}

- (BOOL)isDelete
{
    return [self.method isEqual:@"DELETE"];
}

- (BOOL)isGet
{
    return [self.method isEqual:@"GET"];
}


/**
 *  将response的字符串转化为对应的对象
 *
 *  @return SmartWatchData对象或者子对象
 */
- (EasyNoteData*)responseStringToObject
{
    if (self.error) {
        NSLog(@"%s %@",__FUNCTION__,self.error);
        return nil;
    }
    
    NSDictionary *dic = [self.responseString JSONValue];
    
    return [[EasyNoteData alloc] initWithDictionary:dic];
}

/**
 *  将response的字符串转化为对于的字典
 *
 *  @return 字典
 */
- (NSDictionary*)responseStringToDictionary
{
    if (self.error) {
        NSLog(@"%s %@",__FUNCTION__,self.error);
        return nil;
    }
    NSString *str = self.responseString;
    //NSLog(@"responseString:%@",self.responseString);
    return [self.responseString JSONFragmentValue];
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    EasyNoteRequest *newRequest = [super copyWithZone:zone];
    
    newRequest.subUrl = self.subUrl;
    newRequest.formValue = self.formValue;
    newRequest.method = self.method;
    
    return newRequest;
}

@end
