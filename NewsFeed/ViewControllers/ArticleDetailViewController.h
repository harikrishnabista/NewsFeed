//
//  ArticleDetailViewController.h
//  NewsFeed
//
//  Created by Bista on 9/28/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"

@interface ArticleDetailViewController : UIViewController<UIWebViewDelegate>
@property (nonatomic,weak) Article* selectedArticle;
@end
