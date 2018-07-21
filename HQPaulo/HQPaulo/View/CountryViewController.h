//
//  CountryViewController.h
//  HQPaulo
//
//  Created by Paulo Correa on 20/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import "CountryViewModel.h"
#import <UIKit/UIKit.h>

@interface CountryViewController : UIViewController
- (instancetype)initWithViewModel:(CountryViewModel *)viewModel;
@end
