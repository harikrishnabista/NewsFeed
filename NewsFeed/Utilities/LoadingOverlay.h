//
//  LoadingOverlay.h
//  NewsFeed
//
//  Created by Bista on 9/28/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingOverlay : UIView
+(void)showLoadingIn:(UIView*)parentView;
+(void)showLoadingIn:(UIView*)parentView withMessage:(NSString*)message;
+(void)hideLoadingIn:(UIView*)parentView;
@end

