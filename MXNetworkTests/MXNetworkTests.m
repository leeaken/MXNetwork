//
//  MXNetworkTests.m
//  MXNetworkTests
//
//  Created by aken on 16/10/19.
//  Copyright © 2016年 MXNetwork. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetTestCase.h"
#import "LoginApi.h"


@interface MXNetworkTests : NetTestCase

@end

@implementation MXNetworkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLogin {
    
    NSDictionary *dic = @{@"useraccount":@"8613510624033",
                          @"userpass":@"1E43969CB7CD57C9EB7990D8666A6B91B55E30DDD8B1FD68F065DF22FFB86CE1DC5612B6A286CA55354D693832F71D863BF4CD00425C66C5744A052A2D2D91EC0CDB0E69D47E44DC2C380B239A39A7381B72E2216DD798266308699FB8C88114198520E866E2C521AA7E18CB93EF27B37B199F6783729552BB8AC186684A9912",
                          @"loginAppType": @"moxian"};
    
    LoginApi *api = [[LoginApi alloc] initWithParameter:dic];
    
    [self expectSuccess:api withAssertion:^(YTKBaseRequest *request) {
        
        NSDictionary *dic = (NSDictionary*)request.responseJSONObject;
//        NSDictionary *dict1 = dic[@"data"];
        NSLog(@"dic:%@",dic);
    }];
}

@end
