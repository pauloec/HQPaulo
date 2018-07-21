//
//  CountryViewModel.m
//  HQPaulo
//
//  Created by Paulo Correa on 20/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import "CountryViewModel.h"

@implementation CountryViewModel
- (instancetype)initWithCountries:(NSArray *)countries {
    self = [super init];
    if (self) {
        _countries = countries;
    }
    return self;
}
@end
