//
//  CMParserTestObject.m
//  CocoaMarkdown
//
//  Created by Indragie on 1/14/15.
//  Copyright (c) 2015 Indragie Karunaratne. All rights reserved.
//

#import "CMParserTestObject.h"
#import <CocoaMarkdown/CocoaMarkdown.h>

@interface CMParserTestObject () <CMParserDelegate>
@end

@implementation CMParserTestObject {
    CMParser *_parser;
    NSMutableArray *_foundText;
    NSMutableArray *_didStartHeader;
    NSMutableArray *_didEndHeader;
    NSMutableArray *_didStartLink;
    NSMutableArray *_didEndLink;
    NSMutableArray *_didStartImage;
    NSMutableArray *_didEndImage;
    NSMutableArray *_foundHTML;
    NSMutableArray *_foundInlineHTML;
    NSMutableArray *_foundCodeBlock;
    NSMutableArray *_foundInlineCode;
    NSMutableArray *_didStartUnorderedList;
    NSMutableArray *_didEndUnorderedList;
    NSMutableArray *_didStartOrderedList;
    NSMutableArray *_didEndOrderedList;
}

- (instancetype)initWithDocument:(CMDocument *)document
{
    NSParameterAssert(document);
    if ((self = [super init])) {
        _parser = [[CMParser alloc] initWithDocument:document delegate:self];
        
        _foundText = [[NSMutableArray alloc] init];
        _didStartHeader = [[NSMutableArray alloc] init];
        _didEndHeader = [[NSMutableArray alloc] init];
        _didStartLink = [[NSMutableArray alloc] init];
        _didEndLink = [[NSMutableArray alloc] init];
        _didStartImage = [[NSMutableArray alloc] init];
        _didEndImage = [[NSMutableArray alloc] init];
        _foundHTML = [[NSMutableArray alloc] init];
        _foundInlineHTML = [[NSMutableArray alloc] init];
        _foundCodeBlock = [[NSMutableArray alloc] init];
        _foundInlineCode = [[NSMutableArray alloc] init];
        _didStartUnorderedList = [[NSMutableArray alloc] init];
        _didEndUnorderedList = [[NSMutableArray alloc] init];
        _didStartOrderedList = [[NSMutableArray alloc] init];
        _didEndOrderedList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)parse
{
    [_parser parse];
}

#pragma mark - CMParserDelegate

- (void)parserDidStartDocument:(CMParser *)parser
{
    NSLog(@"parserDidStartDocument");
    _didStartDocument++;
    if (_abortOnStart) {
        [parser abortParsing];
    }
}

- (void)parserDidEndDocument:(CMParser *)parser
{
    NSLog(@"parserDidEndDocument");
    _didEndDocument++;
}

- (void)parserDidAbort:(CMParser *)parser
{
    NSLog(@"parserDidAbort");
    _didAbort++;
}

- (void)parser:(CMParser *)parser foundText:(NSString *)text
{
    NSLog(@"parserFoundText: %@", text);
    [_foundText addObject:text];
}

- (void)parserFoundHRule:(CMParser *)parser
{
    NSLog(@"parserFoundHRule");
    _foundHRule++;
}

- (void)parser:(CMParser *)parser didStartHeaderWithLevel:(NSInteger)level
{
    NSLog(@"parserDidStartHeaderWithLevel: %lu", level);
    [_didStartHeader addObject:@(level)];
}

- (void)parser:(CMParser *)parser didEndHeaderWithLevel:(NSInteger)level
{
    NSLog(@"parserDidEndHeaderWithLevel: %lu", level);
    [_didEndHeader addObject:@(level)];
}

- (void)parserDidStartParagraph:(CMParser *)parser
{
    NSLog(@"parserDidStartParagraph");
    _didStartParagraph++;
}

- (void)parserDidEndParagraph:(CMParser *)parser
{
    NSLog(@"parserDidEndParagraph");
    _didEndParagraph++;
}

- (void)parserDidStartEmphasis:(CMParser *)parser
{
    NSLog(@"parserDidStartEmphasis");
    _didStartEmphasis++;
}

- (void)parserDidEndEmphasis:(CMParser *)parser
{
    NSLog(@"parserDidEndEmphasis");
    _didEndEmphasis++;
}

- (void)parserDidStartStrong:(CMParser *)parser
{
    NSLog(@"parserDidStartStrong");
    _didStartStrong++;
}

- (void)parserDidEndStrong:(CMParser *)parser
{
    NSLog(@"parserDidEndStrong");
    _didEndStrong++;
}

- (void)parser:(CMParser *)parser didStartLinkWithURL:(NSURL *)URL title:(NSString *)title
{
    NSLog(@"parserDidStartLinkWithURL: %@, title: %@", URL.absoluteString, title);
    NSParameterAssert(URL);
    [_didStartLink addObject:@[URL, title ?: NSNull.null]];
}

- (void)parser:(CMParser *)parser didEndLinkWithURL:(NSURL *)URL title:(NSString *)title
{
    NSLog(@"parserDidEndLinkWithURL: %@, title: %@", URL.absoluteString, title);
    NSParameterAssert(URL);
    [_didEndLink addObject:@[URL, title ?: NSNull.null]];
}

- (void)parser:(CMParser *)parser didStartImageWithURL:(NSURL *)URL title:(NSString *)title
{
    NSLog(@"parserDidStartImageWithURL: %@, title: %@", URL.absoluteString, title);
    NSParameterAssert(URL);
    [_didStartImage addObject:@[URL, title ?: NSNull.null]];
}

- (void)parser:(CMParser *)parser didEndImageWithURL:(NSURL *)URL title:(NSString *)title
{
    NSLog(@"parserDidEndImageWithURL: %@, title: %@", URL.absoluteString, title);
    NSParameterAssert(URL);
    [_didEndImage addObject:@[URL, title ?: NSNull.null]];
}

- (void)parser:(CMParser *)parser foundHTML:(NSString *)HTML
{
    NSLog(@"parserFoundHTML: %@", HTML);
    NSParameterAssert(HTML);
    [_foundHTML addObject:HTML];
}

- (void)parser:(CMParser *)parser foundInlineHTML:(NSString *)HTML
{
    NSLog(@"parserFoundInlineHTML: %@", HTML);
    NSParameterAssert(HTML);
    [_foundInlineHTML addObject:HTML];
}

- (void)parser:(CMParser *)parser foundCodeBlock:(NSString *)code info:(NSString *)info
{
    NSLog(@"parserFoundCodeBlock: %@, info: %@", code, info);
    NSParameterAssert(code);
    [_foundCodeBlock addObject:@[code, info ?: NSNull.null]];
}

- (void)parser:(CMParser *)parser foundInlineCode:(NSString *)code
{
    NSLog(@"parserFoundInlineCode: %@", code);
    [_foundInlineCode addObject:code];
}

- (void)parserFoundSoftBreak:(CMParser *)parser
{
    NSLog(@"parserFoundSoftBreak");
    _foundSoftBreak++;
}

- (void)parserFoundLineBreak:(CMParser *)parser
{
    NSLog(@"parserFoundLineBreak");
    _foundLineBreak++;
}

- (void)parserDidStartBlockQuote:(CMParser *)parser
{
    NSLog(@"parserDidStartBlockQuote");
    _didStartBlockQuote++;
}

- (void)parserDidEndBlockQuote:(CMParser *)parser
{
    NSLog(@"parserDidEndBlockQuote");
    _didEndBlockQuote++;
}

- (void)parser:(CMParser *)parser didStartUnorderedListWithTightness:(BOOL)tight
{
    NSLog(@"parserDidStartUnorderedListWithTightness: %u", tight);
    [_didStartUnorderedList addObject:@(tight)];
}

- (void)parser:(CMParser *)parser didEndUnorderedListWithTightness:(BOOL)tight
{
    NSLog(@"parserDidEndUnorderedListWithTightness: %u", tight);
    [_didEndUnorderedList addObject:@(tight)];
}

- (void)parser:(CMParser *)parser didStartOrderedListWithStartingNumber:(NSInteger)num tight:(BOOL)tight
{
    NSLog(@"parserDidStartOrderedListWithStartingNumber: %ld, tight: %u", num, tight);
    [_didStartOrderedList addObject:@[@(num), @(tight)]];
}

- (void)parser:(CMParser *)parser didEndOrderedListWithStartingNumber:(NSInteger)num tight:(BOOL)tight
{
    NSLog(@"parserDidEndOrderedListWithStartingNumber: %ld, tight: %u", num, tight);
    [_didEndOrderedList addObject:@[@(num), @(tight)]];
}

- (void)parserDidStartListItem:(CMParser *)parser
{
    NSLog(@"parserDidStartListItem");
    _didStartListItem++;
}

- (void)parserDidEndListItem:(CMParser *)parser
{
    NSLog(@"parserDidEndListItem");
    _didEndListItem++;
}

@end
