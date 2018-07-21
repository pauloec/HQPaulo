//
//  WeatherViewModel.m
//  HQPaulo
//
//  Created by Paulo Correa on 21/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import "WeatherViewModel.h"

@implementation WeatherViewModel
- (instancetype)initWithForecast:(NSArray *)forecast currentWeather:(WeatherModel *)weather {
    self = [super init];
    if (self) {
        _forecast = forecast;
        _weather = weather;
    }
    return self;
}

@end
