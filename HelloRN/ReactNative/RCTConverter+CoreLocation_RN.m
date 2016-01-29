//
//  CoreLocation+RCTConvert.m
//  HelloRN
//
//  Created by yuki on 16/1/29.
//  Copyright © 2016年 kang.yu.sh. All rights reserved.
//

#import "RCTConverter+CoreLocation_RN.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKGeometry.h>

@implementation RCTConvert (CoreLocation_RN)
RCT_CONVERTER(CLLocationDegrees, CLLocationDegrees, doubleValue);
RCT_CONVERTER(CLLocationDistance, CLLocationDistance, doubleValue);

+ (CLLocationCoordinate2D)CLLocationCoordinate2D:(id)json
{
    json = [self NSDictionary:json];
    return (CLLocationCoordinate2D){
        [self CLLocationDegrees:json[@"latitude"]],
        [self CLLocationDegrees:json[@"longitude"]]
    };
}

@end

@implementation RCTConvert(MapKit_RN)

+ (MKCoordinateSpan)MKCoordinateSpan:(id)json
{
    json = [self NSDictionary:json];
    return (MKCoordinateSpan){
        [self CLLocationDegrees:json[@"latitudeDelta"]],
        [self CLLocationDegrees:json[@"longitudeDelta"]]
    };
}

+ (MKCoordinateRegion)MKCoordinateRegion:(id)json
{
    return (MKCoordinateRegion){
        [self CLLocationCoordinate2D:json],
        [self MKCoordinateSpan:json]
    };
}
@end
