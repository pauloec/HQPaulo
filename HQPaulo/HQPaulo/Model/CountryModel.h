//
//  Country.h
//  HQPaulo
//
//  Created by Paulo Correa on 20/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryModel : NSObject
@property (nonatomic, copy) NSArray *cities;
@property (nonatomic, readonly) NSURL *flagImageUrl;
@property (nonatomic, readonly) NSString *name;
@end
