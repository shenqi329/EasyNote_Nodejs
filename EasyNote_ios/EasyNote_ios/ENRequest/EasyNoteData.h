//
//  SmartWatchData.h
//  ChildGuard
//
//  Created by shenqi329 on 14-10-10.
//  Copyright (c) 2014年 eebbk. All rights reserved.
//

#import "Jastor.h"

#define SMART_WATCH_RESPONSE_CODE_SUCCESS @"000001"


typedef enum {
    SMART_WATCH_DATA_CYCLE_MONDAY = 1,
    SMART_WATCH_DATA_CYCLE_TUESDAY,
    SMART_WATCH_DATA_CYCLE_WEDNESDAY,
    SMART_WATCH_DATA_CYCLE_THURSDAY,
    SMART_WATCH_DATA_CYCLE_FRAIDAY,
    SMART_WATCH_DATA_CYCLE_SATURDAY,
    SMART_WATCH_DATA_CYCLE_SUNDAY,
}SMART_WATCH_DATA_CYCLE_TYPE;

/**
 *  请求回应的字符串对于的对象的通用父对象
 */
@interface EasyNoteData : Jastor
/**
 *  返回码
 */
@property(nonatomic,retain) NSString* code;

/**
 *  描述
 */
@property(nonatomic,retain) NSString* desc;

/**
 *  数据
 */
@property(nonatomic,retain) id        data;


@property(nonatomic,assign,readonly) BOOL isSuccess;

@end
