//
//  CityViewModel.m
//  HQPaulo
//
//  Created by Paulo Correa on 21/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import "CityViewModel.h"

@implementation CityViewModel
- (instancetype)initWithCities:(NSArray *)cities {
    self = [super init];
    if (self) {
        _cities = cities;
    }
    return self;
}
@end
