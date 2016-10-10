//
//  CustomImageView.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 29/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView
-(void)loadImageUsingUrlString:(NSString *)urlString
{
    imageURLString = urlString;
    cache = [Cache sharedManager];
    
    // removal of old image during cell reuse
    self.image = nil;
    
    // Image Loaded from Cache
    if ([cache.imageCache objectForKey:urlString] != nil) {
        self.image = (UIImage *)[cache.imageCache objectForKey:urlString];
        return;
    }
    
    // If not then make a network request and download the image
    NSURL *url = [NSURL URLWithString:urlString];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"Error: %@",error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *imageToCache = [UIImage imageWithData:data];
            if (imageURLString == urlString) {
                self.image = imageToCache;
            }
            [cache.imageCache setObject:imageToCache forKey:urlString];
        });
        
    }] resume];
    
}

@end
