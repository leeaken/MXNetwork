//
//  NetTestCase.h
//  MXNetwork
//
//  Created by aken on 16/10/20.
//  Copyright © 2016年 MXNetwork. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MXRequest.h"

@interface NetTestCase : XCTestCase

@property (nonatomic, assign) NSTimeInterval networkTimeout;

- (void)expectSuccess:(MXRequest *)request;
- (void)expectSuccess:(MXRequest *)request withAssertion:(void(^)(YTKBaseRequest * request)) assertion;
- (void)expectFailure:(MXRequest *)request;
- (void)expectFailure:(MXRequest *)request withAssertion:(void(^)(YTKBaseRequest * request)) assertion;

- (void)waitForExpectationsWithCommonTimeout;
- (void)waitForExpectationsWithCommonTimeoutUsingHandler:(XCWaitCompletionHandler)handler;

@end
