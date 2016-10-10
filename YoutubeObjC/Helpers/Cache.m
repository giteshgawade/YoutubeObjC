//
//  Cache.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 29/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "Cache.h"

@implementation Cache

@synthesize imageCache;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static Cache *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        imageCache = [[NSCache alloc] init];
    }
    return self;
}


@end
