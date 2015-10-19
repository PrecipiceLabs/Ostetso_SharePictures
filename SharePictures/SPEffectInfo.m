//
//  SPEffectInfo.m
//
//  Created by Precipice Labs on 11/30/13.
//  Copyright (c) 2014 Precipice Labs, Inc. All rights reserved.
//

#import "SPEffectInfo.h"
#import "SPAppDelegate.h"
#import "SPViewController.h"

@interface SPEffectInfo()

@property (atomic, strong) NSDictionary *effectInfo;

@end


@implementation SPEffectInfo

- (id) initWithFxInfo: (NSDictionary *)fxInfo
{
    if (!(self = [super init]))
    {
        return nil;
    }
    
    _effectInfo = fxInfo;

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

- (NSString *) getForegroundImageFile
{
    return [_effectInfo objectForKey: @"imageForeground"];
}

- (NSString *) getIconSelectedImageFile
{
    return [_effectInfo objectForKey: @"imageIconSelected"];
}

- (BOOL) saveAsPng
{
    id saveAsPng = [_effectInfo objectForKey: @"saveAsPng"];
    if (saveAsPng && [[_effectInfo valueForKey: @"saveAsPng"] boolValue])
    {
        return YES;
    }
    
    return NO;
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
