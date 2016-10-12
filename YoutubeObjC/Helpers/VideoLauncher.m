
//
//  VideoPlayerView.m
//  YoutubeObjC
//
//  Created by Gitesh Gawade on 12/10/16.
//  Copyright © 2016 Gitesh Demos. All rights reserved.
//

#import "VideoLauncher.h"
@implementation VideoPlayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        NSURL *url = [NSURL URLWithString:@"https://firebasestorage.googleapis.com/v0/b/test-d4628.appspot.com/o/message_movies%252F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=b0e425aa-1c1b-4d68-80bc-09566456e200"];
        AVPlayer *player = [AVPlayer playerWithURL:url];
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
        [self.layer addSublayer:playerLayer];
        playerLayer.frame = self.frame;
        
        [player play];
    }
    return self;
}

@end


@implementation VideoLauncher

-(void)showVideoPlayer
{
    NSLog(@"Animating Video Player");
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *view = [[UIView alloc] initWithFrame:keyWindow.frame];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = CGRectMake(keyWindow.frame.size.width -10, keyWindow.frame.size.height -10, 10, 10);
    [keyWindow addSubview:view];
    
    CGFloat height = keyWindow.frame.size.width * 9 / 16; // 16:9 is aspect ration of all HD videos
    VideoPlayerView *videoPlayerView = [[VideoPlayerView alloc] initWithFrame:CGRectMake(0, 0, keyWindow.frame.size.width, height)];
    [view addSubview:videoPlayerView];
    
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        view.frame = keyWindow.frame;
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] setStatusBarHidden:true withAnimation:UIStatusBarAnimationFade];
    }];
}
@end
