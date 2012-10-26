//
//  CKLocationManager2.h
//  CloudKit
//
//  Created by Fred Brunel.
//  Copyright 2010 WhereCloud Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


/** TODO
 */
extern NSString * const CKLocationManagerUserDeniedNotification;

/** TODO
 */
extern NSString * const CKLocationManagerServiceDidDisableNotification;

@class CKLocationManager2;


/** TODO
 */
@protocol CKLocationManagerDelegate <NSObject>
@optional
- (void)locationManager:(CKLocationManager2 *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;
- (void)locationManager:(CKLocationManager2 *)manager didUpdateHeading:(CLHeading *)newHeading;
- (void)locationManager:(CKLocationManager2 *)manager didFailWithError:(NSError *)error;
@end

//

/** TODO
 */
@interface CKLocationManager2 : NSObject <CLLocationManagerDelegate, UIAlertViewDelegate> {
	NSMutableSet *_delegates;
	CLLocationManager *_locationManager;
	CLHeading *_heading;
	BOOL _updating;
	BOOL _locationAvailable;
	BOOL _shouldDisplayHeadingCalibration;
	BOOL _shouldDisplayLocationServicesAlert;
}

@property (nonatomic, assign, readonly) BOOL updating;
@property (nonatomic, assign, readwrite) BOOL shouldDisplayHeadingCalibration;
@property (nonatomic, assign, readwrite) BOOL shouldDisplayLocationServicesAlert;
@property (nonatomic, retain, readonly) CLLocation *location;
@property (nonatomic, retain, readonly) CLHeading *heading;

+ (id)sharedManager;

- (BOOL)locationAvailable;
- (BOOL)headingAvailable;

- (void)startUpdatingAndStopAfterDelay:(NSTimeInterval)delay;
- (void)startUpdating;
- (void)stopUpdating;

- (void)addDelegate:(id<CKLocationManagerDelegate>)delegate;
- (void)removeDelegate:(id<CKLocationManagerDelegate>)delegate;

- (BOOL)checkLocationAvailabilityWithAlert;

@end