//
//  CMCascadingAttributeStack.h
//  CocoaMarkdown
//
//  Created by Indragie on 1/15/15.
//  Copyright (c) 2015 Indragie Karunaratne. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@class CMAttributeRun;

@interface CMCascadingAttributeStack : NSObject
@property (nonatomic, readonly) NSDictionary<NSString *, id> *cascadedAttributes;

- (void)push:(CMAttributeRun *)run;
- (CMAttributeRun * _Nullable)pop;
- (CMAttributeRun * _Nullable)peek;

@end

NS_ASSUME_NONNULL_END
