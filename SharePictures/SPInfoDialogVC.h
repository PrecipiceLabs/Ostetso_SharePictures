//
//  FFInfoDialogVC.m
//
//  Copyright 2014 Precipice Labs, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPHomeViewController;

// A simple vc that shows our app's documentation in a web browser.

@interface SPInfoDialogVC : UIViewController <UIWebViewDelegate>
{
    SPHomeViewController *_ffVC;

    IBOutlet UIActivityIndicatorView *_activityIndicator;

    IBOutlet UIWebView *_webView;
    
    NSString *_currentHelpEvent;
}

- (void) setFPViewController: (SPHomeViewController *)ffVC;

@end
