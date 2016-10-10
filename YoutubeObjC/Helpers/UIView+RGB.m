//
//  UIView+RGB.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 25/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "UIView+RGB.h"

@implementation UIColor (RGB)

+(UIColor *)rgb:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:alpha];
}

@end
