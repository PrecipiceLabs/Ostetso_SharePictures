//
//  FFEffectInfo.m
//
//  Created by Precipice Labs on 11/30/13.
//  Copyright (c) 2014 Precipice Labs, Inc. All rights reserved.
//

#import "FFEffectInfo.h"
#import "FFAppDelegate.h"
#import "FFViewController.h"


@implementation FFEffectInfo

- (id) initWithFSEInfo: (NSDictionary *)fseInfo
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    _effectInfo = fseInfo;

    return self;
}

+ (NSString *) getEffectsImagePath
{
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath];
    return [resourcePath stringByAppendingPathComponent:@"effects"];
}


- (NSString *) getEffectName
{
    return [_effectInfo objectForKey: @"effectName"];
}

- (NSString *) getEffectClassName
{
    return [_effectInfo objectForKey: @"effectClassname"];
}

- (NSString *) getAmountMethodName
{
    return [_effectInfo objectForKey: @"amountMethodName"];
}

- (NSString *) getIconImageFile
{
    return [_effectInfo objectForKey: @"imageIcon"];
}

- (NSString *) getIconSelectedImageFile
{
    return [_effectInfo objectForKey: @"imageIconSelected"];
}

- (BOOL) hasAmountSlider
{
    id sliderDef = [_effectInfo objectForKey: @"amountSliderDefault"];
    id sliderMin = [_effectInfo objectForKey: @"amountSliderMin"];
    id sliderMax = [_effectInfo objectForKey: @"amountSliderMax"];
    
    return sliderDef && sliderMin && sliderMax;
}

- (float) amountSliderDefault
{
    return [[_effectInfo valueForKey: @"amountSliderDefault"] floatValue];
}

- (float) amountSliderMin
{
    return [[_effectInfo valueForKey: @"amountSliderMin"] floatValue];
}

- (float) amountSliderMax
{
    return [[_effectInfo valueForKey: @"amountSliderMax"] floatValue];
}


@end
