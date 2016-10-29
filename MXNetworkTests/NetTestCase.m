//
//  NetTestCase.m
//  MXNetwork
//
//  Created by aken on 16/10/20.
//  Copyright © 2016年 MXNetwork. All rights reserved.
//

#import "NetTestCase.h"

@implementation NetTestCase

- (void)setUp {
    [super setUp];
    self.networkTimeout = 20.0;
    
}

- (void)tearDown {
    [super tearDown];
//    [[YTKNetworkAgent sharedAgent] cancelAllRequests];
}

- (void)expectSuccess:(MXRequest *)request {
    [self expectSuccess:request withAssertion:nil];
}

- (void)expectSuccess:(MXRequest *)request withAssertion:(void(^)(YTKBaseRequest * request)) assertion {
    XCTestExpectation *exp = [self expectationWithDescription:@"Request should succeed"];
    
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        XCTAssertNotNil(request);
        if (assertion) {
            assertion(request);
        }
        [exp fulfill];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        XCTFail(@"Request should succeed, but failed");
        [exp fulfill];
    }];
    
    [self waitForExpectationsWithCommonTimeout];
}

- (void)expectFailure:(MXRequest *)request {
    [self expectFailure:request withAssertion:nil];
}

- (void)expectFailure:(MXRequest *)request withAssertion:(void(^)(YTKBaseRequest * request)) assertion {
    XCTestExpectation *exp = [self expectationWithDescription:@"Request should fail"];
    
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        XCTFail(@"Request should fail, but succeeded");
        [exp fulfill];
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        XCTAssertNotNil(request);
        if (assertion) {
            assertion(request);
        }
        [exp fulfill];
    }];
    
    [self waitForExpectationsWithCommonTimeout];
}

- (void)waitForExpectationsWithCommonTimeout {
    [self waitForExpectationsWithCommonTimeoutUsingHandler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

- (void)waitForExpectationsWithCommonTimeoutUsingHandler:(XCWaitCompletionHandler)handler {
    [self waitForExpectationsWithTimeout:self.networkTimeout handler:handler];
}

@end
