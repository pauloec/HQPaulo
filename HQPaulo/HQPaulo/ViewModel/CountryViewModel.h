//
//  CountryViewModel.h
//  HQPaulo
//
//  Created by Paulo Correa on 20/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryViewModel : NSObject
- (instancetype)initWithCountries:(NSArray *)countries;
@property (nonatomic, copy) NSArray *countries;
@end
