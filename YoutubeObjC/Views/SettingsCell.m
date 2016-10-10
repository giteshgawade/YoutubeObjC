//
//  SettingsCell.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 04/10/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "SettingsCell.h"

@implementation SettingsCell

@synthesize titleLabel, iconImageview;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
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
    titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor whiteColor];
    
    iconImageview = [[UIImageView alloc] init];
    [iconImageview setTranslatesAutoresizingMaskIntoConstraints:NO];
    iconImageview.backgroundColor = [UIColor blackColor];
}

-(void)setupViews
{
    [self addSubview:iconImageview];
    [self addSubview:titleLabel];
    
    [self addConstraintsWithFormat:@"H:|-5-[v0(20)]" onViews:@[iconImageview]];
    [self addConstraintsWithFormat:@"V:|-5-[v0]-5-|" onViews:@[iconImageview]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
