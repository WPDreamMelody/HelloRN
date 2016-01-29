//
//  CalendarManager.m
//  HelloRN
//
//  Created by yuki on 16/1/29.
//  Copyright © 2016年 kang.yu.sh. All rights reserved.
//

#import "CalendarManager.h"
#import "RCTLog.h"
#import "RCTConvert.h"

static NSString *WEEKDayList[] = {@"", @"日", @"一", @"二", @"三", @"四", @"五", @"六", nil};

@implementation CalendarManager

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
    RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}


RCT_EXPORT_METHOD(iOSMethod:(NSString*)methodName
                  detailParams:(NSDictionary *)params
                  errorCallback:(RCTResponseSenderBlock)errorCallback
                  successCallback:(RCTResponseSenderBlock)successCallback)
{
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    NSString *location = [RCTConvert NSString:params[@"location"]];
    NSDate *time = [RCTConvert NSDate:params[@"time"]];
    NSString *description = [RCTConvert NSString:params[@"description"]];
    RCTLogInfo(@"location is :%@, Time is %@, Description is %@",location,time,description);
    successCallback(@[@"come from iosMethod!"]);
}


RCT_EXPORT_METHOD(findEvents:(NSString*)week
                  callBack:(RCTResponseSenderBlock)callback){
    NSArray *events = [NSArray arrayWithObjects:week, nil];
    callback(@[[NSNull null], events]);
}

- (NSDictionary *)constantsToExport
{
    NSString * weekDay = [CalendarManager weekDayFormat];
    return @{ @"firstDayOfTheWeek": weekDay };
}

+ (NSString *)weekDayFormat{
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitWeekday) fromDate:date];
    return [NSString stringWithFormat:@"星期%@", WEEKDayList[components.weekday]];
}

@end








































