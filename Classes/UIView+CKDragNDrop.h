//
//  UIView+CKDragNDrop.h
//  CloudKit
//
//  Created by Sebastien Morel.
//  Copyright (c) 2012 WhereCloud Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKBinding.h"
#import "CKBindingsManager.h"


typedef enum CKDragEvents{
    CKDragEventNone      = 0,
    CKDragEventBegin     = 1 << 1,
    CKDragEventDrop      = 1 << 2,
    CKDragEventCancelled = 1 << 3,
    CKDragEventDragging  = 1 << 4,
    CKDragEventAll = CKDragEventBegin | CKDragEventDrop | CKDragEventCancelled | CKDragEventDragging
}CKDragEvents;

typedef enum CKDragType{
    CKDragTypeNone,
    CKDragTypeMove,
    CKDragTypeGhost
}CKDragType;

@interface UIView (CKDragNDrop)
@property(nonatomic,assign)CKDragType dragType;
@property(nonatomic,retain,readonly)NSMutableDictionary* dragTargetActions;
@property(nonatomic,assign,readonly)BOOL dragging;
@property(nonatomic,assign,readonly)CGPoint draggingOffset;

- (void)addTarget:(id)target action:(SEL)action forDragEvents:(CKDragEvents)dragEvents;
- (void)removeTarget:(id)target action:(SEL)action forDragEvents:(CKDragEvents)dragEvents;
- (void)sendActionsForDragEvents:(CKDragEvents)dragEvents touch:(UITouch*)touch;

- (NSArray*)hitStackUnderTouch:(UITouch *)touch;

//Private interface : This method will get called each time the draggingOffset is getting changed.
//By default, this sets the view's transform to an affine transform with draggingOffset as translation.
- (void)updateTransform;

@end


@interface UIView (CKDragNDropBindings)

- (void)bindDragEvent:(CKDragEvents)dragEvents withBlock:(void (^)(UIView* view, UITouch* touch, CKDragEvents event))block;
- (void)bindDragEvent:(CKDragEvents)dragEvents target:(id)target action:(SEL)selector;

@end