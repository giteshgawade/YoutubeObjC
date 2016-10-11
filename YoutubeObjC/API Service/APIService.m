//
//  APIService.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 06/10/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "APIService.h"

@implementation APIService

+ (id)sharedManager {
    static APIService *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {

    }
    return self;
}

-(void)fetchVideosWithUrl:(NSURL *)url andCompletion:(DownloadCompletion)completion
{
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@" Error: %@", error);
            return;
        }
        
        NSError *JSONError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&JSONError];
        if (JSONError)
        {
            NSLog(@"Serialization error: %@", JSONError.localizedDescription);
        }
        else
        {
            //NSLog(@"Response: %@", dictionary);
        }
        
        NSMutableArray *videos = [[NSMutableArray alloc] init];
        for(NSDictionary *dict in dictionary)
        {
            Video *video = [[Video alloc] initWithDictionary:dict];
            [videos addObject:video];
        }
        
        // Fix to a Crash BUG
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(videos);
        });
        
    }] resume];
}
@end
