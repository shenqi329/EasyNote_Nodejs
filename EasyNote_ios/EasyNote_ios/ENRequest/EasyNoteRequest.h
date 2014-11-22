//
//  SmartWatchRequest.h
//  ChildGuard
//
//  Created by shenqi329 on 14-10-7.
//  Copyright (c) 2014年 eebbk. All rights reserved.
//

#import "ASIFormDataRequest.h"
#import "EasyNoteRequest.h"
#import "EasyNoteData.h"


/**
 *  请求父类
 */
@interface EasyNoteRequest : ASIFormDataRequest

/**
 *  参见智能手表服务器访问API 中的 路径,如:/mobileaccount   /contact
 */
@property(nonatomic,retain) NSString *subUrl;

/**
 *  表单数据
 */
@property(nonatomic,retain) NSDictionary *formValue;

/**
 * "POST" "GET" "PUT" "DELETE"
 */
@property(nonatomic,retain) NSString *method;

@property(nonatomic,assign,readonly) BOOL isPost;
@property(nonatomic,assign,readonly) BOOL isGet;
@property(nonatomic,assign,readonly) BOOL isPut;
@property(nonatomic,assign,readonly) BOOL isDelete;

/**
 *
 *
 *  @param subUrl    子路径,如 /contact 表示服务器接口的联系人
 *  @param formValue 表单数据 NSDictionary 或者 NSArray
 *  @param method    "POST" "GET" "PUT" "DELETE"
 *
 *  @return
 */
- (id)initWithUrl:(NSString*)subUrl formValue:(id)formValue method:(NSString*)method;

/**
 *  将response的字符串转化为对应的对象
 *
 *  @return SmartWatchData对象或者子对象
 */
- (EasyNoteData*)responseStringToObject;


/**
 *  将response的字符串转化为对于的字典
 *
 *  @return 字典
 */
- (NSDictionary*)responseStringToDictionary;




@end
