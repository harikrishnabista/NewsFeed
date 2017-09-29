//
//  ImageDownloadHelper.m
//  NewsFeed
//
//  Created by Bista on 9/28/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "ImageDownloadHelper.h"

@implementation ImageDownloadHelper

-(NSURLSessionDataTask*)getImageFor:(NSString *)url completion:(void (^)(UIImage *img))completion {
    
    APICaller *caller = [[APICaller alloc] init];
    
    NSURLSessionDataTask* task = [caller getDataFromUrl:url completion:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error == nil && data != nil){
            UIImage *img = [UIImage imageWithData:data];
            
            if(img != nil){
                completion(img);
                return;
            }
        }
        
        completion([UIImage imageNamed:@"noimg"]);
    }];
    
    return task;
}

@end
