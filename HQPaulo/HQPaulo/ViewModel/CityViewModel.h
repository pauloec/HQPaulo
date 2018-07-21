//
//  CityViewModel.h
//  HQPaulo
//
//  Created by Paulo Correa on 21/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityViewModel : NSObject
- (instancetype)initWithCities:(NSArray *)cities;
@property (nonatomic, copy) NSArray *cities;
@end
