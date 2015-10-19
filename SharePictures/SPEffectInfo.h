//
//  SPEffectInfo.h
//
//  Created by Precipice Labs
//  Copyright (c) 2015 Precipice Labs, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// Maintain the settings related to a particular camera effect

@interface SPEffectInfo : NSObject
{
}

// get the path to the .fx file
+ (NSString *) getEffectsImagePath;

// Initialze the SPEffectInfo given the dictionary of settings from the .fx file 
- (id) initWithFxInfo: (NSDictionary *)fxInfo;


// The name of the effect to display in the title bar
- (NSString *) getEffectName;

// The clasname to use to process the effect, usually derived from GPUImageFilter
- (NSString *) getEffectClassName;

// The name of the method in the filter class to call when the on-screen slider is adjusted
- (NSString *) getAmountMethodName;

// The path the to icon file for the effect
- (NSString *) getIconImageFile;

// The path the to icon file for the effect when it's in the selected state
- (NSString *) getIconSelectedImageFile;

// get the path the an image to be used with the effect (eg. overlay)
- (NSString *) getForegroundImageFile;

// Return YES if the effect should be saved as a png file.  For example, the effect results in a transparency that we want to preserve in the resulting file.
- (BOOL) saveAsPng;

// Return YES if the effect should display the amount slider
- (BOOL) hasAmountSlider;
// Default value for the amount slider
- (float) amountSliderDefault;
// Maximum value for the amount slider
- (float) amountSliderMin;
// Minimum value for the amount slider
- (float) amountSliderMax;

@end
