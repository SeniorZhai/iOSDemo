//
//  ZTClient.m
//  SimpleWeather
//
//  Created by 翟涛 on 14-3-6.
//  Copyright (c) 2014年 翟涛. All rights reserved.
//

#import "ZTClient.h"
#import "ZTCondition.h"
#import "ZTDailyForecast.h"

@interface ZTClient()

@property (nonatomic,strong)NSURLSession *session;

@end

@implementation ZTClient

- (id)init{
    if (self = [super init]) {
        NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config];
    }
    return self;
}
- (RACSignal *)fetchJSONFromURL:(NSURL *)url {
    NSLog(@"Fetching:%@",url.absoluteString);
    
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
        NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:url completionHandler:^(NSData *data,NSURLResponse *response,NSError *errror){
            if (!errror) {
                NSError *jsonError = nil;
                id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                if (!jsonError) {
                    [subscriber sendNext:json];
                }
                else{
                    [subscriber sendError:jsonError];
                }
            }
            else{
                [subscriber sendError:errror];
            }
            [subscriber sendCompleted];
        }];
                                          
        [dataTask resume];
        
        return [RACDisposable disposableWithBlock:^{
            [dataTask cancel];
        }];
    }] doError:^(NSError *error){
       //
        NSLog(@"%@",error);
    }];
}

// 获得当前坐标的天气情况

- (RACSignal *)fetchCurrentConditionsForLocation:(CLLocationCoordinate2D)coordinate{
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&units=imperial",coordinate.latitude,coordinate.longitude];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    return [[self fetchJSONFromURL:url] map:^(NSDictionary *json){
        return [MTLJSONAdapter modelOfClass:[ZTCondition class] fromJSONDictionary:json error:nil];
    }];
}

//
- (RACSignal *)fetchHourlyForecastForLocation:(CLLocationCoordinate2D)coordinate{
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweather.org/data/2.5/forecast?lat=%f&lon=%f&units=imperial&cnt=12",coordinate.latitude,coordinate.longitude];
    NSURL *url = [NSURL URLWithString:urlString];
    return [[self fetchJSONFromURL:url] map:^(NSDictionary *json){
        RACSequence *list = [json[@"list"] rac_sequence];
        return [[list map:^(NSDictionary *item){
            return [MTLJSONAdapter modelOfClass:[ZTCondition class] fromJSONDictionary:item error:nil];
        }] array];
    }];
}
// 每日预报
- (RACSignal *)fetchDailyForecastForLocation:(CLLocationCoordinate2D)coordinate{
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweather.org/data/2.5/forecast?lat=%f&lon=%f&units=imperial&cnt=7",coordinate.latitude,coordinate.longitude];
    NSURL *url = [NSURL URLWithString:urlString];
    return [[self fetchJSONFromURL:url] map:^(NSDictionary *json){
        RACSequence *list = [json[@"list"] rac_sequence];
        return [[list map:^(NSDictionary *item){
            return [MTLJSONAdapter modelOfClass:[ZTDailyForecast class] fromJSONDictionary:item error:nil];
        }] array];
    }];
}

@end
