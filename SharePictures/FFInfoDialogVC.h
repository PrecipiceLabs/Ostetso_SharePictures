//
//  FFInfoDialogVC.m
//
//  Copyright 2014 Precipice Labs, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeViewController;

@interface FFInfoDialogVC : UIViewController <UIWebViewDelegate>
{
    HomeViewController *_ffVC;

    IBOutlet UIActivityIndicatorView *_activityIndicator;

    IBOutlet UIWebView *_webView;
    
    NSString *_currentHelpEvent;
}

- (void) setFPViewController: (HomeViewController *)ffVC;

@end
