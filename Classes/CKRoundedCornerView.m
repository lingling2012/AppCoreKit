//
//  BackgroundView.m
//  GroupedTableStyled
//
//  Created by Olivier Collet on 11-04-08.
//  Copyright 2011 WhereCloud Inc. All rights reserved.
//

#import "CKRoundedCornerView.h"
#import "CKUIColorAdditions.h"
#import <CloudKit/CKUIColorAdditions.h>
#import <QuartzCore/QuartzCore.h>

@implementation CKRoundedCornerView

@synthesize corners = _corners;
@synthesize roundedCornerSize = _roundedCornerSize;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.corners = CKRoundedCornerViewTypeNone;
		self.roundedCornerSize = CGSizeMake(10, 10);
    }
    return self;
}

- (void)setCorners:(CKRoundedCornerViewType)newCorners {
	_corners = newCorners;
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
	UIRectCorner roundedCorners = UIRectCornerAllCorners;
	switch (self.corners) {
		case CKRoundedCornerViewTypeTop:
			roundedCorners = (UIRectCornerTopLeft | UIRectCornerTopRight);
			break;
		case CKRoundedCornerViewTypeBottom:
			roundedCorners = (UIRectCornerBottomLeft | UIRectCornerBottomRight);
			break;

		default:
			break;
	}
	if (self.corners != CKRoundedCornerViewTypeNone) {
		[[UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:roundedCorners cornerRadii:self.roundedCornerSize] addClip];
	}
}

- (void)dealloc {
    [super dealloc];
}


@end