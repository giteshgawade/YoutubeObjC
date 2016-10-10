//
//  VideoCell.h
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 25/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LayoutConstraints.h"
#import "CustomImageView.h"
#import "BaseCell.h"
#import "Video.h"

@interface VideoCell : BaseCell
{
    CustomImageView *thumbnailImageView;
    CustomImageView *userProfileImageView;
    UIView *separatorView;
    UILabel *titleLabel;
    UITextView *subtitleTextView;
}

@property(nonatomic,strong) Video *video;

@end
