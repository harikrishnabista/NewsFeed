//
//  ArticleCollectionViewCell.h
//  NewsFeed
//
//  Created by Bista on 9/28/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIView *viewCellContainer;
@property (nonatomic,strong) UIImageView *imgMedia;
@property (nonatomic,strong) UILabel *lblTitle;
@property (nonatomic,strong) UILabel *lblSubTitle;

@property  (nonatomic,strong) NSURLSessionDataTask* imgDownloadTask;
@property (nonatomic,strong) NSLayoutConstraint* bottomOfMedia;

@end
