//
//  SPHomeViewController
//  SharePictures
//
//  Copyright (c) 2015 Precipice Labs. All rights reserved.
//

#import "SPHomeViewController.h"
#import "SPAppDelegate.h"
#import "SPInfoDialogVC.h"
#import "SPEffectInfo.h"
#import "SPViewController.h"

@implementation SPHomeViewController
@synthesize isIPad= _isIPad;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isIPad = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}

// User selected the info button
- (IBAction)infoTapped:(id)sender {
    SPInfoDialogVC *infoDlg = [[SPInfoDialogVC alloc] init];
    [infoDlg setFPViewController: self];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController pushViewController:infoDlg animated:YES];
}

// User selected the carera button, we will process a live effect from the device camera
- (IBAction)cameraTapped:(id)sender
{
    SPViewController *viewController;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        viewController = [[SPViewController alloc] initWithNibName:@"SPViewController_iPhone" bundle:nil];
    }
    else
    {
        viewController = [[SPViewController alloc] initWithNibName:@"SPViewController_iPad" bundle:nil];
    }
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    nav.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    viewController.getImage=@"fromCamera";
    [viewController setCameraCaptureState: YES];
    [self.navigationController pushViewController:viewController animated:YES];

}

// User selected the Ostetso gallery button
- (IBAction)galleryTapped:(id)sender
{
    [Ostetso showGallery];
}

// User selected the photo button, we will process an effect applied to an image loaded from the camera roll
- (IBAction)photosTapped:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = NO;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.navigationBar.barStyle = UIBarStyleDefault;
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        picker.navigationBar.tintColor = [UIColor blackColor];
        UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
        [tempWindow.rootViewController presentViewController:picker animated:YES completion:nil];
    }
}

// The user selected an image to process
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
    SPViewController *viewController;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        viewController = [[SPViewController alloc] initWithNibName:@"SPViewController_iPhone" bundle:nil];
    }
    else
    {
        viewController = [[SPViewController alloc] initWithNibName:@"SPViewController_iPad" bundle:nil];
    }
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    nav.navigationBar.barStyle = UIBarStyleBlackTranslucent; //UIBarStyleBlack;
    viewController.getImage=@"fromGallery";

    viewController.selectedImage=chosenImage;
    [viewController setCameraCaptureState: NO];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

-(UIViewController *)childViewControllerForStatusBarHidden
{
    return nil;
}

- (void) setNotificationsPending: (BOOL) hasPendingNotifications
{
    NSString *imageName;
    if (hasPendingNotifications)
    {
        imageName = @"GotoGallery_HomescreenButton_WithBadge";
    }
    else
    {
        imageName = @"GotoGallery_HomescreenButton";
    }
    
    UIImage *buttonImg = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]];
    
    [self.galleryButton setImage:buttonImg forState:UIControlStateNormal];
    
}

#pragma mark Ostetso delegate methods

// Callback from Ostetso, the user closed the gallery
- (void) galleryComplete: (BOOL) successful
{
    [self.navigationController popViewControllerAnimated:NO];
}

// Callback from Ostetso, the user closed the image sharing view
- (void) shareComplete: (NSError *) error
{
}

// We failed to upload the image to the Ostetso server
- (void) uploadFailedWithError: (NSError *) error
{
}

// We successfully uploaded the image to Ostetso's servers
- (void)didUploadImageWithID:(NSString*)picID URL:(NSString*)picURL
{
}

// The app received a notification via Ostetso, simply display a UIAlertView with the notification message
- (void) notificationReceived: (NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
}



@end
