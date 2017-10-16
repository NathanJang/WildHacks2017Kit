//
//  WildHacks2017Kit.h
//  WildHacks2017Kit
//
//  Created by Jonathan Chan on 2017-10-15.
//  Copyright © 2017 Jonathan Chan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

//! Project version number for WildHacks2017Kit.
FOUNDATION_EXPORT double WildHacks2017KitVersionNumber;

//! Project version string for WildHacks2017Kit.
FOUNDATION_EXPORT const unsigned char WildHacks2017KitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <WildHacks2017Kit/PublicHeader.h>

typedef void (^WHKCompletionHandler)(NSURLResponse *response, id responseObject, NSError *error);

@interface WildHacks2017Kit : NSObject

@property (strong, nonatomic, nonnull) NSString *hostName;

- (instancetype)initWithHostName:(nullable NSString *)hostName;
- (nullable instancetype)init UNAVAILABLE_ATTRIBUTE;
- (void)getUsersWithCompletionHandler:(nullable WHKCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
