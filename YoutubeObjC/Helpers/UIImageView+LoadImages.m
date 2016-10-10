//
//  UIImageView+LoadImages.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 28/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "UIImageView+LoadImages.h"

@implementation UIImageView (LoadImages)

-(void)loadImageUsingUrlString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"Error: %@",error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = [UIImage imageWithData:data];
        });
    }] resume];

}

@end
