//
//  Setting.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 04/10/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "Setting.h"

@implementation Setting

@synthesize name,imageName;

- (id)initWithName:(SettingName)settingName imageName:(NSString *)settingImageName
{
    self = [super init];
    if (self) {
        self.name = settingName;
        self.imageName = settingImageName;
    }
    return self;
}

-(NSString *)getSettingString:(SettingName)settingName
{
    switch (settingName) {
        case Settings:
            return @"Settings";
            break;
        case TermsPrivacy:
            return @"Terms & Privacy";
            break;
        case SendFeedBack:
            return @"Send Feedback";
            break;
        case Help:
            return @"Help";
            break;
        case SwitchAccount:
            return @"Switch Account";
            break;
        default:
            return @"Cancel";
            break;
    }
}
@end
