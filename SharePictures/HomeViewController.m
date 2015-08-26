//
//  HomeViewController.m
//  SharePictures
//
//  Copyright (c) 2015 Precipice Labs. All rights reserved.
//

#import "HomeViewController.h"
#import "FFAppDelegate.h"
#import "FFInfoDialogVC.h"
#import "FFEffectInfo.h"
#import "FFViewController.h"
@interface HomeViewController ()


@end

@implementation HomeViewController
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

- (IBAction)infoTapped:(id)sender {
    FFInfoDialogVC *infoDlg = [[FFInfoDialogVC alloc] init];
    [infoDlg setFPViewController: self];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController pushViewController:infoDlg animated:YES];
}

- (IBAction)cameraTapped:(id)sender
{
    FFViewController *viewController;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        viewController = [[FFViewController alloc] initWithNibName:@"FFViewController_iPhone" bundle:nil];
    }
    else
    {
        viewController = [[FFViewController alloc] initWithNibName:@"FFViewController_iPad" bundle:nil];
    }
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    nav.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    viewController.getImage=@"fromCamera";
    [viewController setCameraCaptureState: YES];
    [self.navigationController pushViewController:viewController animated:YES];

}

- (IBAction)galleryTapped:(id)sender
{
    [Ostetso showGallery];
}

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
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
    FFViewController *viewController;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        viewController = [[FFViewController alloc] initWithNibName:@"FFViewController_iPhone" bundle:nil];
    }
    else
    {
        viewController = [[FFViewController alloc] initWithNibName:@"FFViewController_iPad" bundle:nil];
    }
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    nav.navigationBar.barStyle = UIBarStyleBlackTranslucent; //UIBarStyleBlack;
    viewController.getImage=@"fromGallery";

    viewController.selectedImage=chosenImage;
    viewController.anotherImage=chosenImage;
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

- (void) galleryComplete: (BOOL) successful
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void) shareComplete: (NSError *) error
{
}

- (void) uploadFailedWithError: (NSError *) error
{
}

- (void)didUploadImageWithID:(NSString*)picID URL:(NSString*)picURL
{
}


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
