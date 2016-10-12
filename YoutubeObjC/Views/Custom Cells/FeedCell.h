//
//  FeedCell.h
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 08/10/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "BaseCell.h"
#import "VideoCell.h"
#import "APIService.h"
#import "VideoLauncher.h"

@interface FeedCell : BaseCell <UICollectionViewDataSource,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *videoCollectionView;
    NSMutableArray *videos;
}

@end
