//
//  CityModel.m
//  HQPaulo
//
//  Created by Paulo Correa on 21/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import "CityModel.h"

@interface CityModel ()
@property (nonatomic, readwrite) NSString *name;
@end

@implementation CityModel
- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"city_name"]) {
        self.name = value;
    }
    
    if ([key isEqualToString:@"currently"]) {
        self.currentWeather = value;
    }
}
@end
