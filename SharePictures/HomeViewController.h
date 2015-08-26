//
//  HomeViewController.h
//  SharePictures
//
//  Copyright (c) 2015 Precipice Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFInfoDialogVC.h"
#import "Ostetso/Ostetso.h"
@class FFEffectInfo;

@interface HomeViewController : UIViewController <OstetsoDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>  {
    BOOL                            _isIPad;
    BOOL                            _oldDeviceModel;  // iPhone4, iPad2, or iPod2 or prior

}

@property (strong, nonatomic) IBOutlet UIButton *galleryButton;
@property BOOL isIPad;

- (IBAction)infoTapped:(id)sender;
- (IBAction)cameraTapped:(id)sender;
- (IBAction)photosTapped:(id)sender;
- (IBAction)galleryTapped:(id)sender;

@end
