//
//  SPFilterView.h
//  SharePictures
//
//  Copyright © 2015 Precipice Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPUImage.h"

@class SPEffectInfo;


@interface SPFilterView : NSObject

@property (atomic, retain) GPUImageOutput<GPUImageInput> *filter;
@property (atomic, retain) GPUImageView *view;
@property (atomic, retain) SPEffectInfo *effect;

- (SPFilterView *)initWithFrame: (CGRect) frame;

@end
