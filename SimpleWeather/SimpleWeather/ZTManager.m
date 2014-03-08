//
//  ZTManager.m
//  SimpleWeather
//
//  Created by 翟涛 on 14-3-6.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTManager.h"
#import <TSMessages/TSBlurView.h>
#import "ZTClient.h"

@interface ZTManager()

@property (nonatomic,strong,readwrite) ZTCondition *currentCondition;
@property (nonatomic,strong,readwrite) CLLocation *currentLocation;
@property (nonatomic,strong,readwrite) NSArray *hourlyForecast;
@property (nonatomic,strong,readwrite) NSArray *dailyForecast;

@property (nonatomic,strong)CLLocationManager *locationManager;
@property (nonatomic,assign)BOOL isFirstUpdate;
@property (nonatomic,strong)ZTClient *client;

@end

@implementation ZTManager

+ (instancetype)sharedManager{
    static id _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}
- (id)init {
    if (self = [super init]) {
        // 1
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        
        // 2
        _client = [[ZTClient alloc] init];
        
        // 3
        [[[[RACObserve(self, currentLocation)
            // 4
            ignore:nil]
           // 5
           // Flatten and subscribe to all 3 signals when currentLocation updates
           flattenMap:^(CLLocation *newLocation) {
               return [RACSignal merge:@[
                                         [self updateCurrentConditions],
                                         [self updateDailyForecast],
                                         [self updateHourlyForecast]
                                         ]];
               // 6
           }] deliverOn:RACScheduler.mainThreadScheduler]
         // 7
         subscribeError:^(NSError *error) {
             [TSMessage showNotificationWithTitle:@"Error"
                                         subtitle:@"There was a problem fetching the latest weather."
                                             type:TSMessageNotificationTypeError];
         }];
    }
    return self;
} 
@end
