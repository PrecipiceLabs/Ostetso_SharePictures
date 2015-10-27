//
//  SPFilterView.m
//  SharePictures
//
//  Created by Precipice Labs on 10/16/15.
//  Copyright © 2015 Precipice Labs. All rights reserved.
//

#import "SPFilterView.h"



@implementation SPFilterView

- (SPFilterView *)initWithFrame: (CGRect) frame
{
    self.view = [[GPUImageView alloc] initWithFrame: frame];
    return self;
}

@end