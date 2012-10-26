//
//  CKUIImage+Factory.h
//  CloudKit
//
//  Created by Olivier Collet.
//  Copyright 2010 WhereCloud Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/** TODO
 */
@interface UIImage (Factory)

+ (UIImage *)imageStack:(NSInteger)nbImages size:(CGSize)size edgeInsets:(UIEdgeInsets)insets;

@end