//
//  APIService.h
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 06/10/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Video.h"

// Declare a block to be used as parameter in method as parameter
typedef void(^DownloadCompletion)(NSMutableArray *videosArray);

@interface APIService : NSObject

+ (id)sharedManager;

-(void)fetchVideos:(DownloadCompletion)completion;

-(void)fetchVideosWithUrl:(NSURL *)url andCompletion:(DownloadCompletion)completion;
@end
