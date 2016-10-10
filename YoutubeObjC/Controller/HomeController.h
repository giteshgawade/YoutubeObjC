//
//  ViewController.h
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 25/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LayoutConstraints.h"
#import "CustomImageView.h"
#import "VideoCell.h"
#import "MenuBar.h"
#import "Video.h"
#import "SettingsLauncher.h"
#import "FeedCell.h"
#import "TrendingCell.h"
#import "SubscriptionCell.h"

@class MenuBar;

@interface HomeController : UICollectionViewController <UICollectionViewDelegateFlowLayout>
{
    MenuBar *menuBar;
}

-(void)showControllerForSetting:(Setting *)setting;
-(void)scrollToMenuIndex:(int)index;

@end