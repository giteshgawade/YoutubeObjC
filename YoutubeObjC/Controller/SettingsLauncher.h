//
//  SettingsLauncher.h
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 03/10/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsCell.h"
#import "Setting.h"
#import "HomeController.h"

@class HomeController;

@interface SettingsLauncher : NSObject<UITableViewDelegate,UITableViewDataSource>
{
    UIView *blackView;
    UITableView *settingsOptionsTable;
    UIWindow *window;
    NSArray *settings;
}

@property(nonatomic,strong) HomeController *homeController;

-(void)showSettings;

@end
