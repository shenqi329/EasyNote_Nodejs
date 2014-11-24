//
//  ENLoginRequestTest.m
//  EasyNote_ios
//
//  Created by shenqi329 on 14/11/22.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "EasyNoteRequestTest.h"
#import "ENLoginRequest.h"

@interface ENLoginRequestTest : EasyNoteRequestTest

@end

@implementation ENLoginRequestTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPreformanceGet{
    [self measureBlock:^{
        
        ENLoginRequest *request = [[ENLoginRequest alloc] initPostRequestWithUsername:@"liuxjunshi" password:@"123456ab"];
        request.delegate = self;
        [request startAsynchronous];
        
        self.expectation = [self expectationWithDescription:@"获取安全区域失败"];
        
        [self waitForExpectationsWithTimeout:EASY_NOTE_REQUEST_TEST_TIME_OUT handler:^(NSError *error) {
            
        }];
        
        EasyNoteData *data = (EasyNoteData*)[request responseStringToObject];
        XCTAssertNotNil(data,@"获取的数据没办法转化为对象");
        XCTAssertTrue(data.isSuccess,@"返回数据错误");
        
    }];
}
@end
