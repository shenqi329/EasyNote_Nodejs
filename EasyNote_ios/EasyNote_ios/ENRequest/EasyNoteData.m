//
//  SmartWatchData.m
//  ChildGuard
//
//  Created by shenqi329 on 14-10-10.
//  Copyright (c) 2014年 eebbk. All rights reserved.
//

#import "EasyNoteData.h"

@implementation EasyNoteData

+ (NSString*)cycleWithType:(SMART_WATCH_DATA_CYCLE_TYPE)type
{
    NSString *cycle = nil;
    switch (type) {
        case SMART_WATCH_DATA_CYCLE_MONDAY:
            cycle = @"星期一";
            break;
        case SMART_WATCH_DATA_CYCLE_TUESDAY:
            cycle = @"星期二";
            break;
        case SMART_WATCH_DATA_CYCLE_WEDNESDAY:
            cycle = @"星期三";
            break;
        case SMART_WATCH_DATA_CYCLE_THURSDAY:
            cycle = @"星期四";
            break;
        case SMART_WATCH_DATA_CYCLE_FRAIDAY:
            cycle = @"星期五";
            break;
        case SMART_WATCH_DATA_CYCLE_SATURDAY:
            cycle = @"星期六";
            break;
        case SMART_WATCH_DATA_CYCLE_SUNDAY:
            cycle = @"星期日";
            break;
            
        default:
            break;
    }
    return cycle;
}

- (BOOL)isSuccess
{
    return [self.code isEqualToString:SMART_WATCH_RESPONSE_CODE_SUCCESS];
}

@end
