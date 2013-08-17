/* Copyright (C) 2012 IGN Entertainment, Inc. */

#import "VideoPlayerSampleView.h"

@interface VideoPlayerSampleView()

@property (nonatomic, weak) UIView *topView;
@property (nonatomic, readwrite, strong) UIButton *playButton;
@property (nonatomic, readwrite, strong) UIButton *playFullScreenButton;
@property (nonatomic, readwrite, strong) UIButton *removeVideoViewButton;

@end

@implementation VideoPlayerSampleView

- (id)initWithTopView:(UIView *)topView videoPlayerView:(UIView *)pVideoPlayerView
{
    if ((self = [super init])) {
        self.playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.playButton setTitle:@"Play Video" forState:UIControlStateNormal];
        [self addSubview:self.playButton];
        
        self.playFullScreenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.playFullScreenButton setTitle:@"Play Fullscreen Video" forState:UIControlStateNormal];
        [self addSubview:self.playFullScreenButton];

        self.removeVideoViewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.removeVideoViewButton setTitle:@"Remove video view" forState:UIControlStateNormal];
//        [self addSubview:self.removeVideoViewButton];
        [self insertSubview:self.removeVideoViewButton atIndex:20];
//        self.removeVideoViewButton.hidden = YES;
        
        self.videoPlayerView = pVideoPlayerView;
        
        self.backgroundColor = [UIColor whiteColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect bounds = self.bounds;
    self.playFullScreenButton.frame = CGRectMake((bounds.size.width - 200)/2.0,
                                                 (bounds.size.height - 100)/2.0,
                                                 200,
                                                 50);
    
    self.playButton.frame = CGRectMake((bounds.size.width - 100)/2.0,
                                       self.playFullScreenButton.frame.origin.y + self.playFullScreenButton.frame.size.height + 10,
                                       100,
                                       50);
    
    self.removeVideoViewButton.frame = CGRectMake((bounds.size.width - 200),
                                                 0,
                                                 200,
                                                 50);

}

@end
