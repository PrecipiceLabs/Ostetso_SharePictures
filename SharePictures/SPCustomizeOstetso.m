//
//  SPCustomizeOstetso.m
//  SharePictures
//
//  Created by Mitch Middler on 11/9/15.
//  Copyright © 2015 Precipice Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPCustomizeOstetso.h"
#import "Ostetso/Ostetso.h"

@implementation SPCustomizeOstetso

+ (void) customizeOstetso
{
    [Ostetso setGalleryToolbarColor: [UIColor colorWithRed:.22 green:0.22 blue:0.22 alpha:1.0]];                   // Background color for the gallery toolbar.  A color here with a blurred menu will set the tint for the menu
    [Ostetso enableGalleryToolbarBlur: NO];                                                                        // Enable/disable toolbar blur
    [Ostetso setGalleryMenuButtonListBackgroundColor: [UIColor colorWithRed:.22 green:0.22 blue:0.22 alpha:1.0]];  // Background color for the filter option popup
     //[Ostetso setGalleryMenuReturnToAppButtonImg: (UIImage *)image;                                              // Image icon for the return to app button
    [Ostetso setGalleryFilterButtonSelectedColor: [UIColor colorWithRed:.77 green:0.77 blue:0.77 alpha:1.0]];      // Background color currently selected filter button
    [Ostetso setGalleryFilterButtonColor: [UIColor colorWithRed:.15 green:0.15 blue:0.15 alpha:1.0]];              // Background color unselected filter buttons
    //[Ostetso setGalleryFilterButtonFont: (UIFont *) font;                                                        // Font for the filter button labels
    //[Ostetso setGalleryInfoButtonImg: (UIImage *) image;                                                         // Image icon for the info button
    //[Ostetso setGalleryManageAccountButtonImg: (UIImage *) image;                                                // Image icon for the accounts settings button
    
    // Gallery View
    [Ostetso setGalleryBackgroundColor: [UIColor colorWithRed:0. green:0. blue:0. alpha:1.0]];                    // Background color for the gallery
    [Ostetso setGalleryBorderColor: [UIColor colorWithRed:1. green:0. blue:0. alpha:0.0]];                        // Border color for the gallery items
    [Ostetso setGalleryBorderWidth: 1.];                                                                          // Border width for the gallery items
    [Ostetso setGalleryBorderRadius: 0.];                                                                         // Border radius for the gallery items.   Use 0 for squared corners
    [Ostetso setGalleryImageSpacing: CGSizeMake(0.,0.)];                                                          // Horizontal and Vertical space between gallery items
       
    // Single Column Image View
    //[Ostetso setImageViewBackgroundColor: (UIColor *) color];             // Background color for the single column view.  nil => inherit from galleryBackgroundColor
    //[Ostetso setImageViewBorderColor: (UIColor *) color];                 // Border color for the single column view items.  nil => inherit from galleryBorderColor
    //[Ostetso setImageViewBorderWidth: (float) width];                     // Border width for the single column view items.  -1 => inherit from galleryBorderWidth
    //[Ostetso setImageViewBorderRadius: (float) radius];                   // Border radius for the single column view items.   Use 0 for squared corners.  -1 => inherit from galleryBorderRadius
    //[Ostetso setImageViewImageSpacing: (float) spacing];                  // Vertical space between single column view items.  -1 => inherit from galleryImageSpacing
    //[Ostetso setImageViewInfoBackgroundColor: (UIColor *) color];         // Background color for the app info area in the single column view (ie. "Created with..." section)
    //[Ostetso setImageViewReturnToAppButtonImg: (UIImage *) image];        // Image icon for the return to app button
    //[Ostetso setImageViewReturntoGalleryButtonImg: (UIImage *) image];    // Image icon for return to multi-column gallery button
    //[Ostetso setImageViewAppStoreFont: (UIFont *) font];                  // Font for "App store" label
    //[Ostetso setImageViewInfoFont: (UIFont *) font];                      // Font for "Created with..."
    //[Ostetso setImageViewInfoFontiPad: (UIFont *) font];                  // Font for "Created with..." on iPad
    //[Ostetso setImageViewAppNameFont: (UIFont *) font];                   // Font for app name
    //[Ostetso setImageViewAppNameFontiPad: (UIFont *) font];               // Font for app name on iPad
    
    // Gallery Button Bar
    [Ostetso setButtonBarBackgroundColor: [UIColor colorWithRed:.22 green:0.22 blue:0.22 alpha:1.0]];    // Background color for the button bar for each gallery item
    //[Ostetso setLikeButtonImg: (UIImage *) image];                                                     // Image icon for the like button
    //[Ostetso setLikeButtonSelectedImg: (UIImage *) image];                                             // Image icon for the like button selected state
    //[Ostetso setLikeButtonDisabledImg: (UIImage *) image];                                             // Image icon for the like button disabled state
    //[Ostetso setShareButtonImg: (UIImage *) image];                                                    // Image icon for the share button
    //[Ostetso setShareButtonDisabledImg: (UIImage *) image];                                            // Image icon for the like button disabled state
    //[Ostetso setMoreButtonImg: (UIImage *) image];                                                     // Image icon for the image settings button
    //[Ostetso setImageViewButtonCountFont: (UIFont *) font];                                            // Font for the action count on the gallery item button bar (number of likes and shares) in the single column view
    //[Ostetso setGalleryButtonCountFont: (UIFont *) font];                                              // Font for the action count on the gallery item button bar (number of likes and shares) in the multi column view
    
    // Account Management
    [Ostetso setAcctButtonTitleColor: [UIColor colorWithRed:.7 green:0.7 blue:0.7 alpha:1.0]];
    [Ostetso setAcctButtonBackgroundColor: [UIColor colorWithRed:.35 green:0.35 blue:0.35 alpha:1.0]];
    [Ostetso setAcctButtonBorderColor: [UIColor colorWithRed:.9 green:0.9 blue:0.9 alpha:1.0]];
    [Ostetso setAcctViewBorderWidth: 1.];
    [Ostetso setAcctViewBorderColor: [UIColor colorWithRed:.22 green:0.22 blue:0.2 alpha:1.0]];
    //[Ostetso setAcctButtonFont: (UIFont *) font];
    
    
}

@end