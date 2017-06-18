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
@property (nonatomic, readonly) NSDictionary *attributes;
@property (nonatomic, readonly) CMFontSymbolicTraits fontTraits;
@property (nonatomic) NSInteger orderedListItemNumber;
@property (nonatomic, readonly) BOOL listTight;

- (instancetype)initWithAttributes:(NSDictionary *)attributes
                        fontTraits:(CMFontSymbolicTraits)fontTraits
                 orderedListNumber:(NSInteger)orderedListNumber;

@end

CMAttributeRun * CMDefaultAttributeRun(NSDictionary *attributes);
CMAttributeRun * CMTraitAttributeRun(NSDictionary *attributes, CMFontSymbolicTraits traits);
CMAttributeRun * CMOrderedListAttributeRun(NSDictionary *attributes, NSInteger startingNumber);

NS_ASSUME_NONNULL_END
