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
    IBOutlet UIWebView *_webView;
}


@end
