//
//  AppDelegate.m
//  HQPaulo
//
//  Created by Paulo Correa on 20/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//


#import "CountryModel.h"
#import "CountryViewModel.h"
#import "CountryViewController.h"
#import "DataService.h"
#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, strong) CountryViewModel *viewModel;
@property (nonatomic, strong) DataService *viewModelService;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.navigationController = [UINavigationController new];
    
    UIViewController *viewController = [self createInitialViewController];
    [self.navigationController pushViewController:viewController animated:NO];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIViewController *)createInitialViewController {
    self.viewModelService = [DataService new];
    self.viewModel = [[CountryViewModel alloc] initWithCountries:[self.viewModelService countriesForJson]];
    return [[CountryViewController alloc] initWithViewModel:self.viewModel];
}

@end
