//
//  CKPopoverController.m
//  CloudKit
//
//  Created by Sebastien Morel on 11-08-10.
//  Copyright 2011 Wherecloud. All rights reserved.
//

#import "CKPopoverController.h"
#import "CKNSObject+Bindings.h"
#import "CKContainerViewController.h"
#import <objc/runtime.h>


@interface UIViewController ()
@property(nonatomic,assign,readwrite) BOOL isInPopover;
@end


@interface CKPopoverController ()
@property(nonatomic,assign) UIInterfaceOrientation orientation;
@end

@implementation CKPopoverController
@synthesize autoDismissOnInterfaceOrientation;
@synthesize didDismissPopoverBlock = _didDismissPopoverBlock;
@synthesize orientation = _orientation;

- (void)postInit{
    [self.contentViewController setIsInPopover:YES];
    self.autoDismissOnInterfaceOrientation = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (id)initWithContentViewController:(UIViewController *)viewController{
    self = [super initWithContentViewController:viewController];
    [self postInit];
    return self;
}

- (id)initWithContentViewController:(UIViewController *)viewController contentSize:(CGSize)contentSize{
    viewController.contentSizeForViewInPopover = contentSize;
    self = [super initWithContentViewController:viewController];
    [self postInit];
    return self;
}

- (id)initWithContentViewController:(UIViewController *)viewController inNavigationController:(BOOL)navigationController{
    UIViewController* content = viewController;
    if(navigationController){
        content = [[[UINavigationController alloc]initWithRootViewController:viewController]autorelease];
    }
    self = [super initWithContentViewController:content];
    [self postInit];
    return self;
}

- (id)initWithContentViewController:(UIViewController *)viewController contentSize:(CGSize)contentSize inNavigationController:(BOOL)navigationController{
    viewController.contentSizeForViewInPopover = contentSize;
    UIViewController* content = viewController;
    if(navigationController){
        content = [[[UINavigationController alloc]initWithRootViewController:viewController]autorelease];
    }
    self = [super initWithContentViewController:content];
    [self postInit];
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
    [self clearBindingsContext];
    [_didDismissPopoverBlock release];
    [super dealloc];
}

- (void)presentPopoverFromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated{
    self.delegate = self;
    [self retain];
    [super presentPopoverFromRect:rect inView:view permittedArrowDirections:arrowDirections animated:animated];
    
    self.orientation = self.contentViewController.interfaceOrientation;
}

- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(UIPopoverArrowDirection)arrowDirections animated:(BOOL)animated{
    self.delegate = self;
    [self retain];
    [super presentPopoverFromBarButtonItem:item permittedArrowDirections:arrowDirections animated:animated];
    
    self.orientation = self.contentViewController.interfaceOrientation;
}

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController{
    return YES;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    if(_didDismissPopoverBlock){
        _didDismissPopoverBlock(self);
    }
    [self autorelease];
}

- (void)orientationChanged:(NSNotification*)notif{
    BOOL shouldDismiss = NO;
    
    UIDeviceOrientation o = [[UIDevice currentDevice]orientation];
    switch(self.orientation){
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:{
            if(o == UIDeviceOrientationLandscapeRight || o == UIDeviceOrientationLandscapeLeft){
                shouldDismiss = YES;
            }
            break;
        }
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:{
            if(o == UIDeviceOrientationPortrait || o == UIDeviceOrientationPortraitUpsideDown){
                shouldDismiss = YES;
            }
            break;
        }
    }
    
    if(shouldDismiss && autoDismissOnInterfaceOrientation){
        [self dismissPopoverAnimated:YES];
        if(_didDismissPopoverBlock){
            _didDismissPopoverBlock(self);
        }
        [self autorelease];
    }
}

@end

static char UIViewControllerIsInPopoverKey;

@implementation UIViewController (CKPopoverController)
@dynamic isInPopover;

- (void)setIsInPopover:(BOOL)isInPopover{
    [self willChangeValueForKey:@"isInPopover"];
    objc_setAssociatedObject(self, 
                             &UIViewControllerIsInPopoverKey,
                             [NSNumber numberWithBool:isInPopover],
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"isInPopover"];
}

- (BOOL)isInPopover{
    NSNumber* number = objc_getAssociatedObject(self, &UIViewControllerIsInPopoverKey);
    if(!number)
        return NO;
    return [number boolValue];
}

@end