//
//  WeatherViewModel.h
//  HQPaulo
//
//  Created by Paulo Correa on 21/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import "WeatherModel.h"
#import <Foundation/Foundation.h>

@interface WeatherViewModel : NSObject
- (instancetype)initWithForecast:(NSArray *)forecast currentWeather:(WeatherModel *)weather;
@property (nonatomic, copy) NSArray *forecast;
@property (nonatomic, copy) WeatherModel *weather;
@end
