//
//  CKNSArray+ValueTransformer.h
//  CloudKit
//
//  Created by Sebastien Morel.
//  Copyright 2011 Wherecloud. All rights reserved.
//

#import <Foundation/Foundation.h>


/** TODO
 */
@interface NSArray (CKValueTransformer)

+ (NSArray*)convertFromNSArray:(NSArray*)array withContentClassName:(NSString*)className;
+ (id)convertFromNSArray:(NSArray*)array;
+ (id)objectArrayFromDictionaryArray:(NSArray*)array;

@end