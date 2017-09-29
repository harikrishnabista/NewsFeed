//
//  HomeViewController.m
//  NewsFeed
//
//  Created by Bista on 9/27/17.
//  Copyright © 2017 practice. All rights reserved.
//

#import "HomeViewController.h"
#import "NewsFeedDataHandler.h"
#import "ArticleCollectionViewCell.h"
#import "ImageDownloadHelper.h"
#import "LoadingOverlay.h"
#import "ArticleDetailViewController.h"

@interface HomeViewController ()
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSArray<Article*> *articles;
@end

@implementation HomeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Research & Insights";
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
//    self.collectionView.spaci
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.collectionView registerClass:[ArticleCollectionViewCell class] forCellWithReuseIdentifier:@"articleCell"];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:_collectionView];
    
    [self setupConstraintForCollectionView];
    
    [self downloadFeed];
    
    UIBarButtonItem *btnRefresh = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(btnRefreshTapped:)];
    
    self.navigationItem.rightBarButtonItem = btnRefresh;
    
//    self.navigationController.navigationItem.rightBarButtonItem =
}

- (void) btnRefreshTapped:(id)sender{
    [self downloadFeed];
}

-(void)downloadFeed{
    // cancelling all the pending image downloading tasks
    for (ArticleCollectionViewCell* cell in self.collectionView.visibleCells) {
        [cell.imgDownloadTask cancel];
    }
    
    [LoadingOverlay showLoadingIn:self.view withMessage:@"Loading Articles..."];
    
    NewsFeedDataHandler* dh = [[NewsFeedDataHandler alloc] init];
    [dh getArticles:@"https://www.personalcapital.com/blog/feed/?cat=3%2C891%2C890%2C68%2C284" completion:^(NSArray<Article *> *articles) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [LoadingOverlay hideLoadingIn:self.view];
            
            self.articles = [[NSArray alloc] initWithArray:articles];
            [self.collectionView reloadData];
        });
    }];
}

-(void)setupConstraintForCollectionView{
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                            attribute:NSLayoutAttributeLeading
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                             attribute:NSLayoutAttributeTrailing
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeTrailing
                                                            multiplier:1.0 constant:-10];
    
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.collectionView
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];
    self.collectionView.clipsToBounds = YES;
    
    [NSLayoutConstraint activateConstraints:@[top,left,bottom,right]];
    
}

#pragma mark - UICollectionView delegate methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.articles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ArticleCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"articleCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[ArticleCollectionViewCell alloc] init];
    }
    
    
    
    Article* article = self.articles[indexPath.row];
    
    cell.lblTitle.text = article.title;
    cell.lblSubTitle.text = article.desc;
    cell.backgroundColor=[UIColor clearColor];
    cell.imgMedia.image = [UIImage imageNamed:@"noimg"];
    
    ImageDownloadHelper* imgDHelper = [[ImageDownloadHelper alloc] init];
    
    [LoadingOverlay showLoadingIn:cell.imgMedia withMessage:@""];
    
    // storing download task to cancel if cell if no more visible
    
    cell.imgDownloadTask = [imgDHelper getImageFor:article.mediaContentUrl completion:^(UIImage *img) {
        [LoadingOverlay hideLoadingIn:cell.imgMedia];
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.imgMedia setImage:img];
        });
    }];
    
    // for main news slight layout change
    if(indexPath.row == 0){
        cell.bottomOfMedia.constant = -80;
        cell.lblTitle.numberOfLines = 2;
    }

    return cell;
}

// cancelling the downloading imgae because cell is no more visible
-(void)collectionView:(UICollectionView *)collectionView
didEndDisplayingCell:(UICollectionViewCell *)cell
   forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if(((ArticleCollectionViewCell*)cell).imgDownloadTask.state == NSURLSessionTaskStateRunning){
        [((ArticleCollectionViewCell*)cell).imgDownloadTask cancel];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        return CGSizeMake(self.collectionView.frame.size.width, (self.view.frame.size.width - 30)/1.5);
    }
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        return CGSizeMake((self.view.frame.size.width - 10*5)/3, (self.view.frame.size.width-10*5)/3);
    }else{
        return CGSizeMake((self.view.frame.size.width - 10*3)/2, (self.view.frame.size.width-10*3)/2);
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ArticleDetailViewController* viewCon = [[ArticleDetailViewController alloc] init];
    viewCon.selectedArticle = self.articles[indexPath.row];
    [self.navigationController pushViewController:viewCon animated:YES];
}

- (void)viewWillLayoutSubviews;{
    [super viewWillLayoutSubviews];
    UICollectionViewFlowLayout *flowLayout = (id)self.collectionView.collectionViewLayout;
    
    [flowLayout invalidateLayout]; //force the elements to get laid out again with the new size
}

@end

