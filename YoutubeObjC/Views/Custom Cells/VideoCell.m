//
//  VideoCell.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 25/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "VideoCell.h"

@implementation VideoCell

-(Video *)getVideo
{
    return _video;
}

-(void)setVideo:(Video *)video
{
    _video = video;
    
    [self setupThumbnailImage:_video.thumbnail_image_name];
    [self setupUserProfileImage:_video.channel.profile_image_name];

    titleLabel.text = _video.title;
    subtitleTextView.text = [NSString stringWithFormat: @"%@ • Total Views %d • 2 years ago",_video.channel.name,(int)_video.number_of_views];
}

-(void)initializeViews
{
    thumbnailImageView = [[CustomImageView alloc] init];
    thumbnailImageView.contentMode = UIViewContentModeScaleAspectFill;
    thumbnailImageView.clipsToBounds = YES;
    
    userProfileImageView = [[CustomImageView alloc] init];
    userProfileImageView.layer.cornerRadius = 22;
    userProfileImageView.contentMode = UIViewContentModeScaleAspectFill;
    userProfileImageView.clipsToBounds = YES;
    
    separatorView = [[UIView alloc] init];
    separatorView.backgroundColor = [UIColor colorWithRed:230/255 green:230/255 blue:230/255 alpha:1];
    
    titleLabel = [[UILabel alloc] init];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.text = @"Taylor Swift - Blank Space";
    
    subtitleTextView = [[UITextView alloc] init];
    subtitleTextView.translatesAutoresizingMaskIntoConstraints = NO;
    subtitleTextView.text = @"TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago";
    subtitleTextView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0);
    subtitleTextView.textColor = [UIColor lightGrayColor];
}

-(void)setupThumbnailImage:(NSString *)urlString
{
    [thumbnailImageView loadImageUsingUrlString:urlString];
}

-(void)setupUserProfileImage:(NSString *)urlString
{
    [userProfileImageView loadImageUsingUrlString:urlString];
}

-(void)setupViews
{
    // Add subviews
    [self addSubview:thumbnailImageView];
    [self addSubview:userProfileImageView];
    [self addSubview:titleLabel];
    [self addSubview:subtitleTextView];
    [self addSubview:separatorView];
    
    // Layout Constraints
    
    [self addConstraintsWithFormat:@"H:|-16-[v0]-16-|" onViews:@[thumbnailImageView]];
    [self addConstraintsWithFormat:@"H:|-16-[v0(44)]" onViews:@[userProfileImageView]];
    
    
    //    //vertical constraints
    [self addConstraintsWithFormat:@"V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|" onViews:@[thumbnailImageView, userProfileImageView,separatorView]];
    
    [self addConstraintsWithFormat:@"H:|[v0]|" onViews:@[separatorView]];

    //    //top constraint
    [self addConstraint: [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:thumbnailImageView attribute:NSLayoutAttributeBottom multiplier:1 constant:8]];
    //    //left constraint
    [self addConstraint: [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:userProfileImageView attribute:NSLayoutAttributeRight multiplier:1 constant:8]];
    //    //right constraint
    [self addConstraint: [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:thumbnailImageView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    //    //height constraint
    [self addConstraint: [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:20]];
    
 
    
    //    //top constraint
    [self addConstraint: [NSLayoutConstraint constraintWithItem:subtitleTextView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1 constant:4]];
    //    //left constraint
    [self addConstraint: [NSLayoutConstraint constraintWithItem:subtitleTextView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:userProfileImageView attribute:NSLayoutAttributeRight multiplier:1 constant:8]];
    //    //right constraint
    [self addConstraint: [NSLayoutConstraint constraintWithItem:subtitleTextView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:thumbnailImageView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    //    //height constraint
    [self addConstraint: [NSLayoutConstraint constraintWithItem:subtitleTextView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0 constant:30]];
}

@end
