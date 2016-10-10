//
//  CustomImageView.h
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 29/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cache.h"


@interface CustomImageView : UIImageView
{
    NSString *imageURLString;
    Cache *cache;
}

-(void)loadImageUsingUrlString:(NSString *)urlString;

@end

