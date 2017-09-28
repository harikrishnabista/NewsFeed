//
//  NewsFeedDataHandler.h
//  NewsFeed
//
//  Created by Bista on 9/27/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Article.h"

@interface NewsFeedDataHandler : NSObject<NSXMLParserDelegate>

-(void)getArticles:(NSString *)url completion:(void (^)(NSArray<Article*>* articles))completion;

@end
