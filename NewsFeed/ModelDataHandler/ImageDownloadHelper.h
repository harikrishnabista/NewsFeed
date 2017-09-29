//
//  ImageDownloadHelper.h
//  NewsFeed
//
//  Created by Bista on 9/28/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "APICaller.h"

@interface ImageDownloadHelper : NSObject

-(NSURLSessionDataTask*)getImageFor:(NSString *)url completion:(void (^)(UIImage *img))completion;

@end
