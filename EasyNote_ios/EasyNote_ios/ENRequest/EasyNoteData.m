//
//  SmartWatchData.m
//  ChildGuard
//
//  Created by shenqi329 on 14-10-10.
//  Copyright (c) 2014年 eebbk. All rights reserved.
//

#import "EasyNoteData.h"

@implementation EasyNoteData

- (BOOL)isSuccess
{
    return [self.code isEqualToString:SMART_WATCH_RESPONSE_CODE_SUCCESS];
}

@end
