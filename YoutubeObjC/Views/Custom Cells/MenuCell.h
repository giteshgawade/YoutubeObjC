//
//  MenuCell.h
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 26/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LayoutConstraints.h"
#import "UIView+RGB.h"
#import "BaseCell.h"

@interface MenuCell : BaseCell
{
    BOOL highlighted;
    BOOL selected;
}

@property(nonatomic,strong) UIImageView *imageView;


@end
