//
//  MenuCell.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 26/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

@synthesize imageView;

-(void)initializeViews
{
    imageView = [[UIImageView alloc] init];
    imageView.image = [[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imageView.tintColor = [UIColor rgb:91 green:14 blue:13 alpha:1];
    
    // Need to add observer to the property selected and Highlighted
}

-(void)setupViews
{
    [self addSubview:imageView];
    [self addConstraintsWithFormat:@"H:[v0(30)]" onViews:@[imageView]];
    [self addConstraintsWithFormat:@"V:[v0(30)]" onViews:@[imageView]];
    
    
    [self addConstraint: [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self addConstraint: [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

-(BOOL)getSelected
{
    return selected;
}

-(void)setSelected:(BOOL)newValue
{
    selected = newValue;
    imageView.tintColor = selected ? [UIColor whiteColor] : [UIColor rgb:91 green:14 blue:13 alpha:1];
}


@end
