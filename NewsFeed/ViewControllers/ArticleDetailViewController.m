//
//  ArticleDetailViewController.m
//  NewsFeed
//
//  Created by Bista on 9/28/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "ArticleDetailViewController.h"
#import "LoadingOverlay.h"

@interface ArticleDetailViewController ()
@property (strong, nonatomic) UIWebView *webview;
@property (strong, nonatomic) UIActivityIndicatorView *activityView;
@property (strong, nonatomic) NSLayoutConstraint *topWebView;

@end

@implementation ArticleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.webview.backgroundColor = UIColor.whiteColor;
    
    self.title = self.selectedArticle.title;
    
    UIBarButtonItem *btnBack=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"iconBack"]
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(btnBackTapped:)];
    
    self.navigationItem.leftBarButtonItem=btnBack;
    
    self.webview = [[UIWebView alloc] init];
    [self.view addSubview:self.webview];
    [self setupWebView];
    
    NSString *urlString = [self.selectedArticle.link stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];

    [self.webview loadRequest:requestObj];
    
    self.webview.delegate = self;

    self.activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.activityView startAnimating];
    [self.view addSubview:self.activityView];
    
    [self setUpActivityViewMiddleOfWebView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) orientationChanged:(NSNotification *)note{
    UIDevice * device = note.object;
    
//    if(device.orientation == UIDeviceOrientationPortrait || device.orientation == UIDeviceOrientationPortraitUpsideDown){
//        self.topWebView.constant = 64;
//    }else{
//        self.topWebView.constant = 40;
//    }
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        self.topWebView.constant = 64;
    }else{
        if(device.orientation == UIDeviceOrientationPortrait || device.orientation == UIDeviceOrientationPortraitUpsideDown){
            self.topWebView.constant = 64;
        }else{
            self.topWebView.constant = 32;
        }
    }
}

-(NSString *) URLEncodeString:(NSString *) str{
    NSMutableString *tempStr = [NSMutableString stringWithString:str];
    [tempStr replaceOccurrencesOfString:@" " withString:@"+" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [tempStr length])];
    
    return [[NSString stringWithFormat:@"%@",tempStr] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

-(void)setUpActivityViewMiddleOfWebView{
    self.activityView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:self.activityView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.webview
                                                            attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:self.activityView
                                                             attribute:NSLayoutAttributeCenterY
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.webview
                                                             attribute:NSLayoutAttributeCenterY
                                                            multiplier:1.0 constant:0];
    

    
    [NSLayoutConstraint activateConstraints:@[centerX,centerY]];
}

#pragma UIWebView Delegate methods
-(void)webViewDidStartLoad:(UIWebView *)webView {
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.activityView stopAnimating];
    self.activityView.hidden = YES;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self.activityView stopAnimating];
    self.activityView.hidden = YES;
}

-(void)setupWebView{
    self.webview.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.webview
                                                                             attribute:NSLayoutAttributeLeft
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.view
                                                                             attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.webview
                                                                              attribute:NSLayoutAttributeRight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeRight
                                                                             multiplier:1.0 constant:0];
    
    
    self.topWebView = [NSLayoutConstraint constraintWithItem:self.webview
                                                                            attribute:NSLayoutAttributeTop
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.view
                                                                            attribute:NSLayoutAttributeTop multiplier:1.0 constant:64];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.webview
                                                                               attribute:NSLayoutAttributeBottom
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        self.topWebView.constant = 64;
    }else{
        if(deviceOrientation == UIDeviceOrientationPortrait || deviceOrientation == UIDeviceOrientationPortraitUpsideDown){
            self.topWebView.constant = 64;
        }else{
            self.topWebView.constant = 32;
        }
    }
    
    [NSLayoutConstraint activateConstraints:@[self.topWebView,left,right,bottom]];
}

- (void) btnBackTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
