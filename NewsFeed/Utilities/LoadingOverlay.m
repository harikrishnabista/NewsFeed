//
//  LoadingOverlay.m
//  NewsFeed
//
//  Created by Bista on 9/28/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "LoadingOverlay.h"

@implementation LoadingOverlay

const int LOADING_VIEW_TAG = 13513;
//const int LOADING_VIEW_TAG = 13513;

UIView * view;

- (id)initWithFrame:(CGRect)frame andMessage:(NSString*)message
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        self.tag = LOADING_VIEW_TAG;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        UILabel *label = [[UILabel alloc] init];
        
        [spinner startAnimating];
        spinner.translatesAutoresizingMaskIntoConstraints =NO;
        
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [label setText:message];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        
        [self addSubview:spinner];
        [self addSubview:label];
        
        NSLayoutConstraint* centerSpinnerH = [NSLayoutConstraint constraintWithItem:spinner
                                                                          attribute:NSLayoutAttributeCenterX
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:spinner.superview
                                                                          attribute:NSLayoutAttributeCenterX
                                                                         multiplier:1.f constant:0.f];
        
        NSLayoutConstraint* centerSpinnerV = [NSLayoutConstraint constraintWithItem:spinner
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:spinner.superview
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.f constant:0.f];
        
        NSLayoutConstraint* centerLabelH = [NSLayoutConstraint constraintWithItem:label
                                                                        attribute:NSLayoutAttributeCenterX
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:label.superview
                                                                        attribute:NSLayoutAttributeCenterX
                                                                       multiplier:1.f constant:0.f];
        
        NSLayoutConstraint* allignLabelToSpinnerBottom = [NSLayoutConstraint constraintWithItem:label
                                                                                      attribute:NSLayoutAttributeTop
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:spinner
                                                                                      attribute:NSLayoutAttributeBottom
                                                                                     multiplier:1.f constant:5];
        
        
        
        [self addConstraint:centerSpinnerH];
        [self addConstraint:centerSpinnerV];
        [self addConstraint:centerLabelH];
        [self addConstraint:allignLabelToSpinnerBottom];
        
        
    }
    return self;
}

+(void)showLoadingIn:(UIView *)parentView withMessage:(NSString *)message{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
        //
        for (UIView* view in [parentView subviews]) {
            if(view.tag==LOADING_VIEW_TAG && [view isKindOfClass:[LoadingOverlay class]] ){
                [view removeFromSuperview];
            }
        }
        CGRect frame;
        frame.origin = CGPointMake(0, 0);
        frame.size = CGSizeMake(parentView.frame.size.width, parentView.frame.size.height);
        UIView *loadingView = [[LoadingOverlay alloc] initWithFrame:frame andMessage:message];
        
        NSDictionary *viewsDictionary =
        NSDictionaryOfVariableBindings(loadingView);
        
        [parentView addSubview:loadingView];
        NSArray *constraints1 =
        [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[loadingView]-0-|"
                                                options:0 metrics:nil views:viewsDictionary];
        NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[loadingView]-0-|"
                                                                        options:0 metrics:nil views:viewsDictionary];
        [parentView addConstraints:constraints1];
        [parentView addConstraints:constraints2];
        
        loadingView.alpha = 0.0;
        [UIView animateWithDuration:0.5 animations:^{
            loadingView.alpha = 1.0;
        }];
    }];
}

+(void)showLoadingIn:(UIView *)parentView{
    [LoadingOverlay showLoadingIn:parentView withMessage:@"Loading..."];
}

+(void)hideLoadingIn:(UIView *)parentView{
    
//    self.alpha = 0.0;
//    [UIView animateWithDuration:0.5 animations:^{
//        self.alpha = 1.0;
//    }];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^ {
        for (UIView* view in [parentView subviews]) {
            if(view.tag==LOADING_VIEW_TAG && [view isKindOfClass:[LoadingOverlay class]] ){
                
                [UIView animateWithDuration:0.5 animations:^{
                    view.alpha = 0.0;
                } completion:^(BOOL finished) {
                    [view removeFromSuperview];
                }];
            }
        }
    }];
}

@end
