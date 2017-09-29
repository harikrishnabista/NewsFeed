//
//  ArticleCollectionViewCell.m
//  NewsFeed
//
//  Created by Bista on 9/28/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "ArticleCollectionViewCell.h"

@implementation ArticleCollectionViewCell

//@Pro NSLayoutConstraint *bottomOfMedia

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

-(void)setupSubViews{
    self.viewCellContainer = [[UIView alloc] init];
    self.imgMedia = [[UIImageView alloc] init];
    self.lblTitle = [[UILabel alloc] init];
    self.lblSubTitle = [[UILabel alloc ] init];
    
    [self addSubview:self.viewCellContainer];
    [self.viewCellContainer addSubview:self.imgMedia];
    [self.viewCellContainer addSubview:self.lblSubTitle];
    [self.viewCellContainer addSubview:self.lblTitle];
    
    self.viewCellContainer.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leftViewCellContainer = [NSLayoutConstraint constraintWithItem:self.viewCellContainer
                                                                             attribute:NSLayoutAttributeLeft
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self
                                                                             attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *rightViewCellContainer = [NSLayoutConstraint constraintWithItem:self.viewCellContainer
                                                                              attribute:NSLayoutAttributeRight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self
                                                                              attribute:NSLayoutAttributeRight
                                                                             multiplier:1.0 constant:0];
    
    
    NSLayoutConstraint *topViewCellContainer = [NSLayoutConstraint constraintWithItem:self.viewCellContainer
                                                                            attribute:NSLayoutAttributeTop
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self
                                                                            attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottomViewCellContainer = [NSLayoutConstraint constraintWithItem:self.viewCellContainer
                                                                               attribute:NSLayoutAttributeBottom
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self
                                                                               attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    [NSLayoutConstraint activateConstraints:@[leftViewCellContainer,rightViewCellContainer,topViewCellContainer,bottomViewCellContainer]];
    
    self.viewCellContainer.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.viewCellContainer.layer.borderWidth = 1.0;
    
    //        self.viewCellContainer.clipsToBounds = YES;
    //    }
    
    //    if(self.imgMedia == nil){
    
    
    
    self.imgMedia.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.imgMedia
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.viewCellContainer
                                                            attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.imgMedia
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.viewCellContainer
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1.0 constant:0];
    
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.imgMedia
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.viewCellContainer
                                                           attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    self.bottomOfMedia = [NSLayoutConstraint constraintWithItem:self.imgMedia
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.viewCellContainer
                                                              attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-60];
    
//    self.imgMedia.image = [UIImage imageNamed:@"sampleicon"];
    self.imgMedia.contentMode = UIViewContentModeScaleAspectFill;
    self.imgMedia.clipsToBounds = YES;
    
    [NSLayoutConstraint activateConstraints:@[top,left,self.bottomOfMedia,right]];
    //    }
    
    //    if(self.lblTitle == nil){
    
    
    
    self.lblTitle.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leftLblTitle = [NSLayoutConstraint constraintWithItem:self.lblTitle
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.imgMedia
                                                                    attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    
    NSLayoutConstraint *rightLblTitle = [NSLayoutConstraint constraintWithItem:self.lblTitle
                                                                     attribute:NSLayoutAttributeRight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.imgMedia
                                                                     attribute:NSLayoutAttributeRight
                                                                    multiplier:1.0 constant:-10];
    
    
    NSLayoutConstraint *topLblTitle = [NSLayoutConstraint constraintWithItem:self.lblTitle
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.imgMedia
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0 constant:10];
    
    
    [NSLayoutConstraint activateConstraints:@[leftLblTitle,rightLblTitle,topLblTitle]];
    
    [self.lblTitle setFont:[UIFont boldSystemFontOfSize:14]];
    self.lblTitle.numberOfLines = 1;
    
    self.lblSubTitle.translatesAutoresizingMaskIntoConstraints = NO;
    self.lblSubTitle.numberOfLines = 1;
    [self.lblSubTitle setFont:[UIFont systemFontOfSize:12]];
    
    
    NSLayoutConstraint *leftLblSubTitle = [NSLayoutConstraint constraintWithItem:self.lblSubTitle
                                                                       attribute:NSLayoutAttributeLeft
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.lblTitle
                                                                       attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *rightLblSubTitle = [NSLayoutConstraint constraintWithItem:self.lblSubTitle
                                                                        attribute:NSLayoutAttributeRight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.lblTitle
                                                                        attribute:NSLayoutAttributeRight
                                                                       multiplier:1.0 constant:0];
    
    
    NSLayoutConstraint *topLblSubTitle = [NSLayoutConstraint constraintWithItem:self.lblSubTitle
                                                                      attribute:NSLayoutAttributeTop
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.lblTitle
                                                                      attribute:NSLayoutAttributeBottom
                                                                     multiplier:1.0 constant:6];
    
    
    [NSLayoutConstraint activateConstraints:@[leftLblSubTitle,rightLblSubTitle,topLblSubTitle]];
}

-(void)drawRect:(CGRect)rect {

}

@end
