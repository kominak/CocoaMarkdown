//
//  CMAttributeRun.h
//  CocoaMarkdown
//
//  Created by Indragie on 1/15/15.
//  Copyright (c) 2015 Indragie Karunaratne. All rights reserved.
//

@import Foundation;
#import "CMPlatformDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMAttributeRun : NSObject
@property (nonatomic, readonly) NSDictionary<NSString *, id> *attributes;
@property (nonatomic, readonly) CMFontSymbolicTraits fontTraits;
@property (nonatomic) NSInteger orderedListItemNumber;
@property (nonatomic, readonly) BOOL listTight;

- (instancetype)initWithAttributes:(NSDictionary<NSString *, id> *)attributes
                        fontTraits:(CMFontSymbolicTraits)fontTraits
                 orderedListNumber:(NSInteger)orderedListNumber;

@end

CMAttributeRun * CMDefaultAttributeRun(NSDictionary<NSString *, id> *attributes);
CMAttributeRun * CMTraitAttributeRun(NSDictionary<NSString *, id> *attributes, CMFontSymbolicTraits traits);
CMAttributeRun * CMOrderedListAttributeRun(NSDictionary<NSString *, id> *attributes, NSInteger startingNumber);

NS_ASSUME_NONNULL_END
