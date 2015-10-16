//
//  SPEffectInfo.h
//
//  Created by Precipice Labs
//  Copyright (c) 2015 Precipice Labs, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SPEffectInfo : NSObject
{
}


@property (atomic, strong) NSDictionary *effectInfo;
@property (atomic, strong) UIButton *button;
@property (atomic, strong) UIActivityIndicatorView *activityIndicator;

+ (NSString *) getEffectsImagePath;

- (id) initWithFSEInfo: (NSDictionary *)fseInfo;

- (NSString *) getEffectName;

- (NSString *) getEffectClassName;
- (NSString *) getAmountMethodName;

- (NSString *) getIconImageFile;
- (NSString *) getIconSelectedImageFile;
- (NSString *) getForegroundImageFile;

- (BOOL) saveAsPng;
- (BOOL) hasAmountSlider;
- (float) amountSliderDefault;
- (float) amountSliderMin;
- (float) amountSliderMax;

@end
