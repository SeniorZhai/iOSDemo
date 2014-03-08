//
//  ZTManager.h
//  SimpleWeather
//
//  Created by 翟涛 on 14-3-6.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ZTCondition.h"
@interface ZTManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic,strong,readonly) CLLocation *currentLoaction;
@property (nonatomic,strong,readonly) ZTCondition *currentCondition;
@property (nonatomic,strong,readonly) NSArray *hourlyForecast;
@property (nonatomic,strong,readonly) NSArray *dailyForecast;

- (void)findCurrentLocation;

@end
