//
//  FFAppDelegate.h
//  FaceFx
//
//  Copyright (c) 2012 Precipice Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
@class HomeViewController;


@interface FFAppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate>
{

}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HomeViewController *viewController;
#ifdef _DEBUG
@property (strong) NSFileManager* fileManager;
#endif


@end
