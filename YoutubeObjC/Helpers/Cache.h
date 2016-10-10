//
//  Cache.h
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 29/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cache : NSObject

@property(nonatomic,strong) NSCache *imageCache;

+ (id)sharedManager;

@end
