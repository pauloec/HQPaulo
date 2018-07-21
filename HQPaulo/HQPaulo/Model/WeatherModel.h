//
//  WeatherModel.h
//  HQPaulo
//
//  Created by Paulo Correa on 21/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject
@property (nonatomic, readonly) NSString *summary;
@property (nonatomic, readonly) NSNumber *maxTemp;
@property (nonatomic, readonly) NSNumber *minTemp;
@property (nonatomic, readonly) NSURL *weatherImgURL;
@end
