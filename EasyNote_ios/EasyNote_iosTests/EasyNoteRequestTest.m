//
//  EasyNoteRequestTest.m
//  EasyNote_ios
//
//  Created by shenqi329 on 14/11/15.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "EasyNoteRequestTest.h"

#import "ASIHTTPRequest.h"

@interface EasyNoteRequestTest()<ASIHTTPRequestDelegate>

@end

@implementation EasyNoteRequestTest

-(void)requestFinished:(ASIHTTPRequest *)request
{
    [self.expectation fulfill];
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"%@",[request error]);
    [self.expectation fulfill];
}

@end
