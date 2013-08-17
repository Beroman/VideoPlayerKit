/* Copyright (C) 2012 IGN Entertainment, Inc. */

#import <UIKit/UIKit.h>

@interface VideoPlayerSampleView : UIView

@property (nonatomic, readonly, strong) UIButton *playButton;
@property (nonatomic, readonly, strong) UIButton *playFullScreenButton;
@property (nonatomic, readonly, strong) UIButton *removeVideoViewButton;
@property (nonatomic, weak) UIView *videoPlayerView;
- (id)initWithTopView:(UIView *)topView videoPlayerView:(UIView *)videoPlayerView;

@end
