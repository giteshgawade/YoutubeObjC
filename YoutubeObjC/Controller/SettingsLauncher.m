//
//  SettingsLauncher.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 03/10/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//



#import "SettingsLauncher.h"

@implementation SettingsLauncher
{
    Setting *setting;
}
static NSString *cellId = @"cellId";

- (id)init
{
    self = [super init];
    if (self) {
        window = [[UIApplication sharedApplication] keyWindow];
        
        if (blackView != nil) {
            [blackView removeFromSuperview];
            blackView = nil;
        }
        
        blackView = [[UIView alloc] init];
        settingsOptionsTable = [[UITableView alloc] init];
        
        settings = @[[[Setting alloc] initWithName:Settings imageName:@"home"],
                     [[Setting alloc] initWithName:TermsPrivacy imageName:@"home"],
                     [[Setting alloc] initWithName:SendFeedBack imageName:@"home"],
                     [[Setting alloc] initWithName:Help imageName:@"home"],
                     [[Setting alloc] initWithName:SwitchAccount imageName:@"home"],
                     [[Setting alloc] initWithName:Cancel imageName:@"home"]
                    ];
    }
    return self;
}

-(void)showSettings
{
    blackView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [window addSubview:blackView];
    [blackView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDismiss:)]];
    blackView.frame = window.frame;
    blackView.alpha = 0;
    
    settingsOptionsTable.backgroundColor = [UIColor whiteColor];
    [window addSubview:settingsOptionsTable];
    [self->settingsOptionsTable registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    settingsOptionsTable.delegate = self;
    settingsOptionsTable.dataSource = self;
    settingsOptionsTable.scrollEnabled = NO;

    CGFloat height = 300;
    CGFloat y = window.frame.size.height - height;
    settingsOptionsTable.frame = CGRectMake(0, window.frame.size.height, window.frame.size.width, height);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        blackView.alpha = 1;
        settingsOptionsTable.frame = CGRectMake(0, y, window.frame.size.width, window.frame.size.height);
    } completion:nil];
}

-(void)handleDismiss:(Setting *)settingObj
{
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        blackView.alpha = 0;
        settingsOptionsTable.frame = CGRectMake(0, window.frame.size.height, window.frame.size.width, window.frame.size.height);
    } completion:^(BOOL finished) {
//        if ([settingObj isKindOfClass:[Setting class]] && ![[NSString stringWithFormat:@"%@", settingObj.name] isEqual: @"Cancel"] ) {
//                [self.homeController showControllerForSetting:settingObj];
//        }
        
        if ([settingObj isKindOfClass:[Setting class]] && settingObj.name != Cancel) {
            [self.homeController showControllerForSetting:settingObj];
        }

    }];
}

#pragma mark TableView-Delegate-and-Datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return settings.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];

//    cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
    
    setting = settings[indexPath.row];
    
    cell.imageView.image = [[UIImage imageNamed:setting.imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    cell.textLabel.text = [setting getSettingString:setting.name];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Setting *settingObj = [settings objectAtIndex:indexPath.row];
    [self handleDismiss:settingObj];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300 / [settings count];
}

@end
