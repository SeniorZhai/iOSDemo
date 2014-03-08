//
//  ZTDailyForecast.m
//  SimpleWeather
//
//  Created by 翟涛 on 14-3-6.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTDailyForecast.h"

@implementation ZTDailyForecast

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSMutableDictionary *paths = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    
    paths[@"tempHigh"] = @"temp.max";
    paths[@"tempLow"] = @"temp.min";
    
    return paths;
}

@end
