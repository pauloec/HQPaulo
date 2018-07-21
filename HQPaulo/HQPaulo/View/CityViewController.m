//
//  CityViewController.m
//  HQPaulo
//
//  Created by Paulo Correa on 21/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "TableViewDataSource.h"
#import "WeatherViewModel.h"
#import "WeatherViewController.h"
#import "CityModel.h"
#import "CityViewModel.h"
#import "CityViewController.h"

static NSString * const HQCellIdentifier = @"CellIdentifier";

@interface CityViewController () <UITableViewDelegate>
@property (nonatomic, retain) CityViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TableViewDataSource *tableViewDataSource;
@end

@implementation CityViewController
#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [self setupTableView];
    [super viewDidLoad];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [super updateViewConstraints];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

#pragma mark - Init
- (instancetype)initWithViewModel:(CityViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return self;
}

#pragma mark - UITableView Datasource
- (void)setupTableView {
    TableViewBlock tableViewBlock = ^(UITableViewCell *cell, CityModel *city) {
        cell.textLabel.text = city.name;
    };
    
    self.tableViewDataSource = [[TableViewDataSource alloc] initCellIdentifier:HQCellIdentifier
                                                                 configureCell:tableViewBlock
                                                                         items:self.viewModel.cities];
    [self.tableView setDataSource:self.tableViewDataSource];
    [self.tableView setDelegate:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:HQCellIdentifier];
    self.tableView.allowsSelection = YES;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CityModel *city = [self.viewModel.cities objectAtIndex:indexPath.row];
    WeatherViewModel *weatherViewModel = [[WeatherViewModel alloc] initWithForecast:city.forecast currentWeather:city.currentWeather];
    WeatherViewController *weatherViewController = [[WeatherViewController alloc] initWithViewModel:weatherViewModel];
    [weatherViewController setTitle:city.name];
    [self.navigationController pushViewController:weatherViewController animated:YES];
}


@end
