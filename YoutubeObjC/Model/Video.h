//
//  Video.h
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 26/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Channel : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *profile_image_name;

@end


@interface Video : NSObject

@property(nonatomic,strong) NSString *thumbnail_image_name;
@property(nonatomic,strong) NSString *title;
@property(nonatomic) NSNumber *number_of_views;
@property(nonatomic) NSNumber *duration;
@property(nonatomic,strong) NSDate *uploadDate;
@property(nonatomic,strong) Channel *channel;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end

