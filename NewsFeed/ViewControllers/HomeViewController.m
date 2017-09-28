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
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
//    self.collectionView.spaci
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.collectionView registerClass:[ArticleCollectionViewCell class] forCellWithReuseIdentifier:@"articleCell"];
    [self.collectionView setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:_collectionView];
    
//    NewsFeedDataHandler* dh = [[NewsFeedDataHandler alloc] init];
//    [dh getArticles:@"https://www.personalcapital.com/blog/feed/?cat=3%2C891%2C890%2C68%2C284" completion:^(NSArray<Article *> *articles) {
//        self.articles = [[NSArray alloc] initWithArray:articles];
//    }];
    
    NSLog(@"here");
}

#pragma mark - UICollectionView delegate methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 40;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"articleCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[ArticleCollectionViewCell alloc] init];
    }
    
    cell.backgroundColor=[UIColor greenColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.frame.size.width/2, self.view.frame.size.width/2);
}

@end

