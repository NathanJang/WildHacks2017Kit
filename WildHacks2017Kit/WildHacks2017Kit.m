//
//  WildHacks2017Kit.m
//  WildHacks2017Kit
//
//  Created by Jonathan Chan on 2017-10-15.
//  Copyright © 2017 Jonathan Chan. All rights reserved.
//

#import "WildHacks2017Kit.h"
#import <AFNetworking/AFNetworking.h>

#define DEFAULT_HOST_NAME @"http://localhost:8080/public"

NS_ASSUME_NONNULL_BEGIN

@interface WildHacks2017Kit ()

@property (strong, nonatomic) AFURLSessionManager *afSessionManager;

@end

@implementation WildHacks2017Kit

- (instancetype)initWithHostName:(nullable NSString *)hostName {
    self = [WildHacks2017Kit new];
    if (self) {
        self.hostName = hostName ? hostName : DEFAULT_HOST_NAME;
        self.afSessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}

#pragma mark - Endpoints

- (NSURL *)urlWithPath:(NSString *)path {
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", self.hostName, path]];
}

//+ (instancetype)sharedInstance {
//    static WildHacks2017Kit *sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [[WildHacks2017Kit alloc] init];
//    });
//    return sharedInstance;
//}

- (void)getUsersWithCompletionHandler:(nullable WHKCompletionHandler)completionHandler {
    NSURLRequest *request = [NSURLRequest requestWithURL:[self urlWithPath:@"/users"]];

    NSURLSessionDataTask *dataTask = [self.afSessionManager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
        completionHandler(response, responseObject, error);
//        [completionHandler res]
    }];
    [dataTask resume];
}

@end

NS_ASSUME_NONNULL_END
