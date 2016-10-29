//
//  LoginApi.m
//  YTKDemo
//
//  Created by aken on 16/9/20.
//  Copyright © 2016年 aken. All rights reserved.
//

#import "LoginApi.h"

@interface LoginApi()

@end

@implementation LoginApi

- (id)initWithParameter:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.paramDictionary = [dictionary mutableCopy];
    }
    return self;
}


- (NSString *)requestUrl {
    return @"http://login.test.moxian.com/mo_common_login/m2/auth/login";
}

- (MXRequestMethod)requestMXMethod {
    return MXRequestMethodPost;
}

- (id)requestArgument {
    return self.paramDictionary;
}

- (MXRequestSerializerType)requestMXSerializerType {
    return MXRequestSerializerTypeJSON;
}

@end
