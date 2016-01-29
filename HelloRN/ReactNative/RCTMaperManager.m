//
//  RCTMapManager.m
//  HelloRN
//
//  Created by yuki on 16/1/28.
//  Copyright © 2016年 kang.yu.sh. All rights reserved.
//

#import "RCTMaperManager.h"
#import <MapKit/MapKit.h>
#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "UIView+React.h"

@interface RCTMaperManager() <MKMapViewDelegate>
@end

@implementation RCTMaperManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    MKMapView *map = [[MKMapView alloc] init];
    //map.delegate = self;
    return map;
}

#pragma mark MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    MKCoordinateRegion region = mapView.region;
    NSDictionary *event = @{
                            @"target": mapView.reactTag,
                            @"region": @{
                                    @"latitude": @(region.center.latitude),
                                    @"longitude": @(region.center.longitude),
                                    @"latitudeDelta": @(region.span.latitudeDelta),
                                    @"longitudeDelta": @(region.span.longitudeDelta),
                                    }
                            };
    [self.bridge.eventDispatcher sendInputEventWithName:@"topChange" body:event];
}
@end