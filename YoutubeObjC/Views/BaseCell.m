//
//  BaseCell.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 25/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeViews];
        [self setupViews];
    }
    return self;
}

-(void)initializeViews
{
    // only initialize
}

-(void)setupViews
{
    // add to subview and put constraints
}


@end
