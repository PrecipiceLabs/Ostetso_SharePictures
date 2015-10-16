//
//  SPAppDelegate.h
//
//  Copyright (c) 2012 Precipice Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPHomeViewController;


@interface SPAppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate>
{

}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SPHomeViewController *viewController;


@end
