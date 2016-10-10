//
//  Setting.h
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 04/10/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    Settings,
    TermsPrivacy,
    SendFeedBack,
    Help,
    SwitchAccount,
    Cancel    
}SettingName;


@interface Setting : NSObject

@property(nonatomic) SettingName name;
@property(nonatomic,strong) NSString *imageName;

- (id)initWithName:(SettingName)settingName imageName:(NSString *)settingImageName;
-(NSString *)getSettingString:(SettingName)settingName;
@end
