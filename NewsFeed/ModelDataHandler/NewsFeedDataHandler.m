//
//  NewsFeedDataHandler.m
//  NewsFeed
//
//  Created by Bista on 9/27/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "NewsFeedDataHandler.h"
#import "APICaller.h"

@implementation NewsFeedDataHandler {
    NSXMLParser *parser;
    
    NSMutableArray<Article*> *feeds;
    
    NSMutableString *title;
    
    
    NSMutableString *desc;
    NSMutableString *link;
    
    NSMutableString *mediaContentUrl;
    
    NSDate *pubDate;

    NSString *element;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        feeds = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)getArticles:(NSString *)url completion:(void (^)(NSArray<Article*>* articles))completion {
    
    APICaller* caller = [[APICaller alloc] init];
    
    [caller getDataFromUrl:url completion:^(NSData *data, NSURLResponse *response, NSError *error) {
        parser = [[NSXMLParser alloc] initWithData:data];
    
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:NO];
        [parser parse];
    
        completion(feeds);
    }];
}

#pragma mark NSXMLParserDelegate delegate methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"item"]) {
        
        title = [[NSMutableString alloc] init];
        
        desc = [[NSMutableString alloc] init];
        link = [[NSMutableString alloc] init];
        
        //        pub    = [[NSMutableString alloc] init];
    }
    
    if([elementName isEqualToString:@"media:content"]){
        NSString* url1 = (NSString*)[attributeDict objectForKey:@"url"];
        mediaContentUrl = [[NSMutableString alloc] initWithString:url1];
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    }else if ([element isEqualToString:@"description"]) {
        [desc appendString:string];
    }else if ([element isEqualToString:@"guid"]) {
        [link appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        
//        title = nil;
//        link = nil;
//        mediaContentUrl = nil;
//        desc = nil;
        
        Article* article = [[Article alloc] init];
        
        article.title = title;
        article.link = link;
        article.mediaContentUrl = mediaContentUrl;
        article.desc = desc;
        
        [feeds addObject:article];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
//    for (Article *article in feeds) {
//        NSLog(@"title: %@",article.title);
//    }
}

@end
