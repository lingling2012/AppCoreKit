//
//  CKDocumentFilteredCollection.h
//  YellowPages
//
//  Created by Martin Dufort on 11-12-08.
//  Copyright (c) 2011 WhereCloud Inc. All rights reserved.
//

#import <CloudKit/CloudKit.h>


@interface CKDocumentFilteredCollection : CKDocumentArrayCollection
@property(nonatomic,retain)CKDocumentCollection* collection;
@property(nonatomic,retain)NSPredicate* predicate;

+ (CKDocumentFilteredCollection*)filteredCollectionWithCollection:(CKDocumentCollection*)collection usingPredicate:(NSPredicate*)predicate;
- (id)initWithCollection:(CKDocumentCollection*)collection usingPredicate:(NSPredicate*)predicate;

@end
