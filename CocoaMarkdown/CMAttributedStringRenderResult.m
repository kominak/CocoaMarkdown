//
//  CMAttributedStringRenderResult.m
//  CocoaMarkdown
//
//  Created by Jake Bellamy on 16/06/17.
//  Copyright © 2017 Indragie Karunaratne. All rights reserved.
//

#import "CMAttributedStringRenderResult.h"

@implementation CMAttributedStringRenderResult

- (instancetype)initWithResult:(NSAttributedString *)result
              blockQuoteRanges:(NSArray<NSValue *> *)blockQuoteRanges
{
    if ((self = [super init])) {
        _result = [result copy];
        _blockQuoteRanges = [blockQuoteRanges copy];
    }
    return self;
}

@end
