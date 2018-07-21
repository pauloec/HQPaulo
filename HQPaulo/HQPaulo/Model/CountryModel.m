//
//  Country.m
//  HQPaulo
//
//  Created by Paulo Correa on 20/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import "CountryModel.h"

@interface CountryModel ()
@property (nonatomic, readwrite) NSString *flagImageUrl;
@property (nonatomic, readwrite) NSString *name;
@end

@implementation Country
- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"flag_image_url"]) {
        self.flagImageUrl = value;
    }
    
    if ([key isEqualToString:@"country_name"]) {
        self.name = value;
    }
    
    if ([key isEqualToString:@"cities"]) {
        self.cities = value;
    }
}

@end
