
//
//  VideoPlayerView.m
//  YoutubeObjC
//
//  Created by Gitesh Gawade on 12/10/16.
//  Copyright © 2016 Gitesh Demos. All rights reserved.
//

#import "VideoLauncher.h"

//NSString * const kLoadedTimeRangesKey   = @"loadedTimeRanges";
//
//NSString * const kKeyPath = @"currentItem.loadedTimeInRanges";
//
////static void *AudioControllerBufferingObservationContext = &AudioControllerBufferingObservationContext;

@implementation VideoPlayerView
{
    UIView *controlsContainerView;
    UIActivityIndicatorView *activityIndicatorView;
    UIButton *pausePlayButton;
    AVPlayer *player;
    UILabel *videoLengthLabel;
    UISlider *videoSlider;
    
    BOOL isPlaying;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        [self setupPlayerView];
        controlsContainerView = [[UIView alloc] initWithFrame:frame];
        controlsContainerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        [self addSubview:controlsContainerView];
        
        activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false;
        [activityIndicatorView startAnimating];
        [controlsContainerView addSubview:activityIndicatorView];
        [activityIndicatorView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = true;
        [activityIndicatorView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = true;
        
        pausePlayButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [pausePlayButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        pausePlayButton.hidden = true;
        pausePlayButton.translatesAutoresizingMaskIntoConstraints = false;
        
        [controlsContainerView addSubview:pausePlayButton];
        [pausePlayButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = true;
        [pausePlayButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = true;
        [pausePlayButton.widthAnchor constraintEqualToConstant:50];
        [pausePlayButton.heightAnchor constraintEqualToConstant:50];
        pausePlayButton.tintColor = [UIColor whiteColor];
        [pausePlayButton addTarget:self action:@selector(handlePausePlay) forControlEvents:UIControlEventTouchUpInside];
        
        videoLengthLabel = [[UILabel alloc] init];
        videoLengthLabel.text = @"00:00";
        videoLengthLabel.textColor = [UIColor whiteColor];
        videoLengthLabel.translatesAutoresizingMaskIntoConstraints = false;
        videoLengthLabel.font = [UIFont boldSystemFontOfSize:14];
        videoLengthLabel.textAlignment = UITextAlignmentRight;
        
        [controlsContainerView addSubview:videoLengthLabel];
        [[videoLengthLabel rightAnchor] constraintEqualToAnchor:self.rightAnchor constant:-4].active = true;
        [[videoLengthLabel bottomAnchor] constraintEqualToAnchor:self.bottomAnchor].active = true;
        [[videoLengthLabel widthAnchor] constraintEqualToConstant:60].active = true;
        [[videoLengthLabel heightAnchor] constraintEqualToConstant:24].active = true;
        
        videoSlider = [[UISlider alloc] init];
        videoSlider.translatesAutoresizingMaskIntoConstraints = false;
        videoSlider.minimumTrackTintColor = [UIColor redColor];
        videoSlider.maximumTrackTintColor = [UIColor whiteColor];
        [videoSlider setThumbImage:[UIImage imageNamed:@"trending"] forState:UIControlStateNormal];
        
        [controlsContainerView addSubview:videoSlider];
        [[videoSlider rightAnchor] constraintEqualToAnchor:videoLengthLabel.leftAnchor].active = true;;
        [[videoSlider bottomAnchor] constraintEqualToAnchor:self.bottomAnchor].active = true;;
        [[videoSlider leftAnchor] constraintEqualToAnchor:self.leftAnchor].active = true;;
        [[videoSlider heightAnchor] constraintEqualToConstant:30].active = true;;
        
    }
    return self;
}

-(void)handlePausePlay
{
    if (isPlaying) {
        [player pause];
        [pausePlayButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    }else{
        [player play];
        [pausePlayButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    }
    
    isPlaying = !isPlaying;
}

-(void)setupPlayerView
{
    NSURL *url = [NSURL URLWithString:@"https://firebasestorage.googleapis.com/v0/b/test-d4628.appspot.com/o/message_movies%252F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=b0e425aa-1c1b-4d68-80bc-09566456e200"];
    player = [AVPlayer playerWithURL:url];
    [player addObserver:self forKeyPath:@"currentItem.loadedTimeRanges" options: NSKeyValueObservingOptionNew context:nil];
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    [self.layer addSublayer:playerLayer];
    playerLayer.frame = self.frame;
    [player play];
    
    isPlaying = true;
}

- (void)observeValueForKeyPath:(NSString*) keyPath
                      ofObject:(id)object
                        change:(NSDictionary*)change
                       context:(void*)context
{
    if ([keyPath  isEqual: @"currentItem.loadedTimeRanges"])
    {
        [activityIndicatorView stopAnimating];
        controlsContainerView.backgroundColor = [UIColor clearColor];
        pausePlayButton.hidden = false;
        
        // Set duration of the video
        int time = CMTimeGetSeconds(player.currentItem.asset.duration);
        int mins = time / 60;
        int secs = time % 60;
        videoLengthLabel.text = [NSString stringWithFormat:@"%d:%d",mins,secs];
        
    }
}
@end


@implementation VideoLauncher

-(void)showVideoPlayer
{
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
