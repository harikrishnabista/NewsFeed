//
//  Article.h
//  XMLParser
//
//  Created by Bista on 9/27/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *desc;
@property (nonatomic,strong) NSString *link;
@property (nonatomic,strong) NSDate *pubDate;
@property (nonatomic,strong) NSString *mediaContentUrl;

@end
