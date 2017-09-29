//
//  APICaller.h
//  NewsFeed
//
//  Created by Bista on 9/27/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APICaller : NSObject
-(NSURLSessionDataTask*)getDataFromUrl:(NSString *)url completion:(void (^)(NSData *data,NSURLResponse *response,NSError *error))completion;
@end
