//
//  CKItemViewControllerFactoryItem.m
//  CloudKit
//
//  Created by Sebastien Morel.
//  Copyright (c) 2011 Wherecloud. All rights reserved.
//

#import "CKItemViewControllerFactoryItem.h"

@interface CKItemViewControllerFactoryItem() 
@property(nonatomic,retain)NSMutableDictionary* params;
@end

NSString* CKItemViewControllerFactoryItemCreate               = @"CKItemViewControllerFactoryItemCreate";
NSString* CKItemViewControllerFactoryItemInit                 = @"CKItemViewControllerFactoryItemInit";
NSString* CKItemViewControllerFactoryItemSetup                = @"CKItemViewControllerFactoryItemSetup";
NSString* CKItemViewControllerFactoryItemSelection            = @"CKItemViewControllerFactoryItemSelection";
NSString* CKItemViewControllerFactoryItemAccessorySelection   = @"CKItemViewControllerFactoryItemAccessorySelection";
NSString* CKItemViewControllerFactoryItemFlags                = @"CKItemViewControllerFactoryItemFlags";
NSString* CKItemViewControllerFactoryItemFilter               = @"CKItemViewControllerFactoryItemFilter";
NSString* CKItemViewControllerFactoryItemSize                 = @"CKItemViewControllerFactoryItemSize";
NSString* CKItemViewControllerFactoryItemBecomeFirstResponder = @"CKItemViewControllerFactoryItemBecomeFirstResponder";
NSString* CKItemViewControllerFactoryItemResignFirstResponder = @"CKItemViewControllerFactoryItemResignFirstResponder";
NSString* CKItemViewControllerFactoryViewDidAppear            = @"CKItemViewControllerFactoryViewDidAppear";
NSString* CKItemViewControllerFactoryViewDidDisappear         = @"CKItemViewControllerFactoryViewDidDisappear";
NSString* CKItemViewControllerFactoryItemLayout               = @"CKItemViewControllerFactoryItemLayout";

/********************************* CKItemViewControllerFactoryItem *********************************
 */


@implementation CKItemViewControllerFactoryItem
@synthesize controllerClass = _controllerClass;
@synthesize params = _params;
@synthesize controllerCreateBlock = _controllerCreateBlock;

- (id)init{
	[super init];
	self.params = [NSMutableDictionary dictionary];
	return self;
}

- (void)dealloc{
	[_params release];
	_params = nil;
	[_controllerCreateBlock release];
	_controllerCreateBlock = nil;
	_controllerClass = nil;
	[super dealloc];
}

- (CKCallback*)createCallback{
	return [_params objectForKey:CKItemViewControllerFactoryItemCreate];
}

- (CKCallback*)initCallback{
	return [_params objectForKey:CKItemViewControllerFactoryItemInit];
}

- (CKCallback*)setupCallback{
	return [_params objectForKey:CKItemViewControllerFactoryItemSetup];
}

- (CKCallback*)selectionCallback{
	return [_params objectForKey:CKItemViewControllerFactoryItemSelection];
}

- (CKCallback*)accessorySelectionCallback{
	return [_params objectForKey:CKItemViewControllerFactoryItemAccessorySelection];
}

- (CKCallback*)becomeFirstResponderCallback{
	return [_params objectForKey:CKItemViewControllerFactoryItemBecomeFirstResponder];
}

- (CKCallback*)resignFirstResponderCallback{
	return [_params objectForKey:CKItemViewControllerFactoryItemResignFirstResponder];
}

- (CKCallback*)viewDidAppearCallback{
	return [_params objectForKey:CKItemViewControllerFactoryViewDidAppear];
}

- (CKCallback*)viewDidDisappearCallback{
	return [_params objectForKey:CKItemViewControllerFactoryViewDidDisappear];
}

- (CKCallback*)layoutCallback{
	return [_params objectForKey:CKItemViewControllerFactoryItemLayout];
}

- (void)setCreateBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryItemCreate];
}

- (void)setInitBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryItemInit];
}

- (void)setSetupBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryItemSetup];
}

- (void)setSelectionBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryItemSelection];
}

- (void)setAccessorySelectionBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryItemAccessorySelection];
}

- (void)setFlagsBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryItemFlags];
}

- (void)setFilterBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryItemFilter];
}

- (void)setSizeBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryItemSize];
}

- (void)setBecomeFirstResponderBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryItemBecomeFirstResponder];
}

- (void)setResignFirstResponderBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryItemResignFirstResponder];
}

- (void)setViewDidAppearBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryViewDidAppear];
}

- (void)setViewDidDisappearBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryViewDidDisappear];
}

- (void)setLayoutBlock:(CKCallbackBlock)block{
	[self.params setObject:[CKCallback callbackWithBlock:block] forKey:CKItemViewControllerFactoryItemLayout];
}

- (void)setCreateTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryItemCreate];
}

- (void)setInitTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryItemInit];
}

- (void)setSetupTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryItemSetup];
}

- (void)setSelectionTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryItemSelection];
}

- (void)setAccessorySelectionTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryItemAccessorySelection];
}

- (void)setFlagsTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryItemFlags];
}

- (void)setFilterTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryItemFilter];
}

- (void)setSizeTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryItemSize];
}

- (void)setBecomeFirstResponderTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryItemBecomeFirstResponder];
}

- (void)setResignFirstResponderTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryItemResignFirstResponder];
}

- (void)setViewDidAppearTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryViewDidAppear];
}

- (void)setViewDidDisappearTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryViewDidDisappear];
}

- (void)setLayoutTarget:(id)target action:(SEL)action{
	[self.params setObject:[CKCallback callbackWithTarget:target action:action] forKey:CKItemViewControllerFactoryItemLayout];
}

- (void)setFlags:(CKItemViewFlags)flags{
	[self.params setObject:[NSNumber numberWithInt:flags] forKey:CKItemViewControllerFactoryItemFlags];
}

- (void)setFilterPredicate:(NSPredicate*)predicate{
	[self.params setObject:predicate forKey:CKItemViewControllerFactoryItemFilter];
}

- (void)setSize:(CGSize)size{
	[self.params setObject:[NSValue valueWithCGSize:size] forKey:CKItemViewControllerFactoryItemSize];
}


- (id)controllerForObject:(id)object atIndexPath:(NSIndexPath*)indexPath{
    CKItemViewController* controller = nil;
    if(_controllerCreateBlock){
        controller = _controllerCreateBlock(object,indexPath);
        self.controllerClass = [controller class];
    }
    else if(self.controllerClass){
        controller = [[[self.controllerClass alloc]init]autorelease];
    }
    else{
        NSAssert(NO,@"This item is not well configured !");
    }
    
    if([self createCallback]){
        controller.createCallback = [self createCallback];
    }
    if([self initCallback]){
        controller.initCallback = [self initCallback];
    }
    if([self setupCallback]){
        controller.setupCallback = [self setupCallback];
    }
    if([self selectionCallback]){
        controller.selectionCallback = [self selectionCallback];
    }
    if([self accessorySelectionCallback]){
        controller.accessorySelectionCallback = [self accessorySelectionCallback];
    }
    if([self becomeFirstResponderCallback]){
        controller.becomeFirstResponderCallback = [self becomeFirstResponderCallback];
    }
    if([self accessorySelectionCallback]){
        controller.accessorySelectionCallback = [self accessorySelectionCallback];
    }
    if([self viewDidAppearCallback]){
        controller.viewDidAppearCallback = [self viewDidAppearCallback];
    }
    if([self viewDidDisappearCallback]){
        controller.viewDidDisappearCallback = [self viewDidDisappearCallback];
    }
    if([self layoutCallback]){
        controller.layoutCallback = [self layoutCallback];
    }
	
    if(controller.value == nil){
        [controller setValue:object];
    }
	[controller performSelector:@selector(setIndexPath:) withObject:indexPath];
	
	if(controller.createCallback){
		[controller.createCallback execute:controller];
	}
	
	return controller;
}

+ (CKItemViewControllerFactoryItem*)itemForObjectWithPredicate:(NSPredicate*)predicate withControllerCreationBlock:(CKItemViewController*(^)(id object, NSIndexPath* indexPath))block{
    CKItemViewControllerFactoryItem* item = [[[CKItemViewControllerFactoryItem alloc]init]autorelease];
	item.controllerCreateBlock = block;
	item.params = [NSMutableDictionary dictionaryWithObject:predicate 
                                                     forKey:CKItemViewControllerFactoryItemFilter];
	return item;
}

+ (CKItemViewControllerFactoryItem*)itemForObjectOfClass:(Class)type withControllerCreationBlock:(CKItemViewController*(^)(id object, NSIndexPath* indexPath))block{
    return [CKItemViewControllerFactoryItem itemForObjectWithPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return [evaluatedObject isKindOfClass:type];
    }] withControllerCreationBlock:block];
}

@end


/********************************* DEPRECATED *********************************
 */

@implementation CKObjectViewControllerFactoryItem
@end