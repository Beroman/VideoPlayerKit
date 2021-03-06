/* Copyright (C) 2012 IGN Entertainment, Inc. */

#import "VideoPlayerSampleViewController.h"
#import "VideoPlayerSampleView.h"

@interface VideoPlayerSampleViewController ()

@property (nonatomic, strong) VideoPlayerKit *videoPlayerViewController;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) VideoPlayerSampleView *videoPlayerSampleView;
@end

@implementation VideoPlayerSampleViewController

- (id)init
{
    if ((self = [super init])) {
        
        // Optional Top View
        _topView = [[UIView alloc] init];
    }
    return self;
}

// Fullscreen / minimize without need for user's input
- (void)fullScreen
{
    if (!self.videoPlayerViewController.fullScreenModeToggled) {
        [self.videoPlayerViewController launchFullScreen];
    } else {
        [self.videoPlayerViewController minimizeVideo];
    }
}

- (void)loadView
{
    self.videoPlayerSampleView = [[VideoPlayerSampleView alloc] initWithTopView:nil videoPlayerView:nil];
    [self.videoPlayerSampleView.playButton addTarget:self action:@selector(playVideoMinimized) forControlEvents:UIControlEventTouchUpInside];
    [self.videoPlayerSampleView.playFullScreenButton addTarget:self action:@selector(playVideoFullScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.videoPlayerSampleView.removeVideoViewButton addTarget:self action:@selector(removeVideoViewFromSuperView) forControlEvents:UIControlEventTouchUpInside];
    [self setView:self.videoPlayerSampleView];
}

- (void)playVideoFullScreen:(BOOL)pFullScreen
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"IMG_0135" ofType:@"MOV"]];
    
    
    if (!self.videoPlayerViewController) {
        self.videoPlayerViewController = [VideoPlayerKit videoPlayerWithContainingViewController:self optionalTopView:_topView hideTopViewWithControls:YES];
        // Need to set edge inset if top view is inserted
        [self.videoPlayerViewController setControlsEdgeInsets:UIEdgeInsetsMake(self.topView.frame.size.height, 0, 0, 0)];
        self.videoPlayerViewController.delegate = self;
        self.videoPlayerViewController.allowPortraitFullscreen = YES;
    }
    
    self.videoPlayerSampleView.videoPlayerView = self.videoPlayerViewController.view;
    [self.view addSubview:self.videoPlayerViewController.view];
    
    [self.videoPlayerViewController playVideoWithTitle:@"Title" URL:url videoID:nil shareURL:nil isStreaming:NO playInFullScreen:pFullScreen];
}

- (void)playVideoMinimized{
    [self playVideoFullScreen:NO];
}

- (void)playVideoFullScreen{
    [self playVideoFullScreen:YES];
}

- (void)removeVideoViewFromSuperView{
    if (self.videoPlayerSampleView.videoPlayerView){
        [self.videoPlayerSampleView.videoPlayerView removeFromSuperview];
    }
    [self.videoPlayerViewController.videoPlayer pause];
    [self.videoPlayerViewController.videoPlayer seekToTime:kCMTimeZero];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topView.frame = CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height, self.view.bounds.size.width, 44);
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (void)setFullScreenToggled:(BOOL)fullScreenToggled{
    [self.videoPlayerSampleView bringSubviewToFront:self.videoPlayerSampleView.removeVideoViewButton];
}

@end
