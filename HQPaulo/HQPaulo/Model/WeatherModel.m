//
//  WeatherModel.m
//  HQPaulo
//
//  Created by Paulo Correa on 21/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import "WeatherModel.h"

@interface WeatherModel ()
@property (nonatomic, readwrite) NSString *summary;
@property (nonatomic, readwrite) NSNumber *maxTemp;
@property (nonatomic, readwrite) NSNumber *minTemp;
@property (nonatomic, readwrite) NSURL *weatherImgURL;
@end

@implementation WeatherModel
- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"summary"]) {
        self.summary = value;
    }
    
    if ([key isEqualToString:@"tempMaxCelcius"]) {
        self.maxTemp = value;
    }
    
    if ([key isEqualToString:@"tempMinCelcius"]) {
        self.minTemp = value;
    }
    
    if ([key isEqualToString:@"iconUrl"]) {
        self.weatherImgURL = [NSURL URLWithString:value];
    }
}

- (id)copyWithZone:(NSZone *)zone {
    id copy = [[[self class] alloc] init];
    if (copy) {
        [copy setSummary:[self.summary copyWithZone:zone]];
        [copy setMaxTemp:[self.maxTemp copyWithZone:zone]];
        [copy setMinTemp:[self.minTemp copyWithZone:zone]];
        [copy setWeatherImgURL:[self.weatherImgURL copyWithZone:zone]];
    }
    return copy;
}
@end
