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
@property(nonatomic,strong) NSString *profileImageName;

@end


@interface Video : NSObject

@property(nonatomic,strong) NSString *thumbnailImageName;
@property(nonatomic,strong) NSString *title;
@property(nonatomic) NSInteger *numberOfViews;
@property(nonatomic,strong) NSDate *uploadDate;
@property(nonatomic,strong) Channel *channel;

@end

