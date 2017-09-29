//
//  Article.m
//  XMLParser
//
//  Created by Bista on 9/27/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "Article.h"

//@property (nonatomic,strong) NSString *title;
//@property (nonatomic,strong) NSString *desc;
//@property (nonatomic,strong) NSString *link;
//@property (nonatomic,strong) NSDate *pubDate;
//@property (nonatomic,strong) NSString *mediaContentUrl;

@implementation Article

@synthesize title = _title;
@synthesize desc = _desc;
@synthesize link = _link;
@synthesize pubDate = _pubDate;
@synthesize mediaContentUrl = _mediaContentUrl;

-(NSString*)link {
    return [NSString stringWithFormat:@"%@?displayMobileNavigation=0",_link];
}

//-(NSAttributedString*)title{
//
//    NSString * htmlString = @"<html><body> Some html string </body></html>";
//    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
//
//    UILabel * myLabel = [UILabel alloc] init];
////    myLabel.attributedText = attrStr;
//
//    return
//}
//
//-(NSString*)desc{
//    return [@"Hari" stringByAppendingString:self.title];
//}


@end
