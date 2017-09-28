//
//  ArticleCollectionViewCell.m
//  NewsFeed
//
//  Created by Bista on 9/28/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "ArticleCollectionViewCell.h"

@implementation ArticleCollectionViewCell

-(void)drawRect:(CGRect)rect {
    
    self.imgMedia = [[UIImageView alloc] initWithFrame:self.frame];
    
//    self.translatesAutoresizingMaskIntoConstraints = false
    
//    let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .top, multiplier: 1, constant: 0)
//    let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: parentView, attribute: .trailing, multiplier: 1, constant: 0)
//
//    let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: parentView, attribute: .bottom, multiplier: 1, constant: 0)
//    let leading = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: parentView, attribute: .leading, multiplier: 1, constant: 0)
//
//    NSLayoutConstraint.activate([top, trailing,bottom,leading])
    
    [self addSubview:self.imgMedia];
    self.imgMedia.translatesAutoresizingMaskIntoConstraints = NO;
    
//    self.btnCoin.translatesAutoresizingMaskIntoConstraints = NO;
    /* Leading space to superview */
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.imgMedia
                                attribute:NSLayoutAttributeLeft
                                relatedBy:NSLayoutRelationEqual
                                toItem:self
                                attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.imgMedia
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeRight
                                                            multiplier:1.0 constant:0];
    
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.imgMedia
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.imgMedia
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    self.imgMedia.image = [UIImage imageNamed:@"sampleicon"];
    self.imgMedia.contentMode = UIViewContentModeScaleAspectFill;
    self.imgMedia.clipsToBounds = YES;
    
    [NSLayoutConstraint activateConstraints:@[top,left,bottom,right]];
}

@end
