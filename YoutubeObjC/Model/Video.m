//
//  Video.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 26/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "Video.h"
@implementation Channel
@synthesize name, profile_image_name;
@end


@implementation Video
@synthesize channel, thumbnail_image_name, title, uploadDate, number_of_views,duration;

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqual: @"channel"]) {
        self.channel = [[Channel alloc] init];
        [self.channel setValuesForKeysWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}
@end

