//
//  APICaller.m
//  NewsFeed
//
//  Created by Bista on 9/27/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "APICaller.h"

@implementation APICaller

-(NSURLSessionDataTask*)getDataFromUrl:(NSString *)url completion:(void (^)(NSData *data,NSURLResponse *response,NSError *error))completion {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session
                                  dataTaskWithURL:[NSURL URLWithString:url]
                                  completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                                      completion(data,response,error);
                                  }];
    
    
    [task resume];
    return task;
}

@end
