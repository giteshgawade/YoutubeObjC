//
//  FeedCell.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 08/10/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "FeedCell.h"

@implementation FeedCell

static NSString *urlString = @"https://s3-us-west-2.amazonaws.com/youtubeassets/home.json";
static NSString *cellId = @"cellId";

-(void)initializeViews
{
    // only initialize
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    videoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    videoCollectionView.backgroundColor = [UIColor whiteColor];
    videoCollectionView.delegate = self;
    videoCollectionView.dataSource = self;
    
    [videoCollectionView registerClass:[VideoCell class] forCellWithReuseIdentifier:cellId];
    
    videos = [[NSMutableArray alloc] init];
}

-(void)fetchVideos
{
    [[APIService sharedManager] fetchVideosWithUrl:[NSURL URLWithString:urlString] andCompletion:^(NSMutableArray *videosArray) {
        videos = videosArray;
        [videoCollectionView reloadData];
    }];
}

-(void)setupViews
{
    // add to subview and put constraints
    [self addSubview:videoCollectionView];
    [self addConstraintsWithFormat:@"H:|[v0]|" onViews:@[videoCollectionView]];
    [self addConstraintsWithFormat:@"V:|[v0]|" onViews:@[videoCollectionView]];
    
    [self fetchVideos];
}


#pragma mark CollectionView_Delegates_Datasource
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return videos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.video = [videos objectAtIndex:indexPath.item];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = ((self.frame.size.width - 16 - 16) * 9 / 16);
    return CGSizeMake(self.frame.size.width, height + 16 + 88);
}

@end
