//
//  DataService.m
//  HQPaulo
//
//  Created by Paulo Correa on 20/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import "CountryModel.h"
#import "CityModel.h"
#import "DataService.h"

@implementation DataService

- (NSArray *)countriesForJson {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"country_data" ofType:@"json"];
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *countries = [NSMutableArray new];
    for (NSDictionary *tempCountry in [jsonObject objectForKey:@"countries"]) {
        CountryModel *country = [CountryModel new];
        for (NSString *key in tempCountry) {
            if ([key isEqualToString:@"cities"]) {
                NSMutableArray *cities = [NSMutableArray new];
                for (NSDictionary *tempCity in [tempCountry objectForKey:key]) {
                    CityModel *city = [CityModel new];
                    for (NSString *keyCity in tempCity) {
                        [city setValue:[tempCity objectForKey:keyCity] forKey:keyCity];
                    }
                    [cities addObject:city];
                }
                [country setValue:cities forKey:key];
            } else {
                [country setValue:[tempCountry objectForKey:key] forKey:key];
            }
        }
        [countries addObject:country];
    }
    
    return [countries copy];
}

@end
