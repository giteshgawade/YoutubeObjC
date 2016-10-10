//
//  SubscriptionCell.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 08/10/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "SubscriptionCell.h"

@implementation SubscriptionCell

static NSString *urlString = @"https://s3-us-west-2.amazonaws.com/youtubeassets/subscriptions.json";

-(void)fetchVideos
{
    [[APIService sharedManager] fetchVideosWithUrl:[NSURL URLWithString:urlString] andCompletion:^(NSMutableArray *videosArray) {
        videos = videosArray;
        [videoCollectionView reloadData];
    }];
}

@end
