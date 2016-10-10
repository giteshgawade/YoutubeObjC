//
//  TrendingCell.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 08/10/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "TrendingCell.h"

@implementation TrendingCell

static NSString *urlString = @"https://s3-us-west-2.amazonaws.com/youtubeassets/trending.json";

-(void)fetchVideos
{
    [[APIService sharedManager] fetchVideosWithUrl:[NSURL URLWithString:urlString] andCompletion:^(NSMutableArray *videosArray) {
        videos = videosArray;
        [videoCollectionView reloadData];
    }];
}

@end
