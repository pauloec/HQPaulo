//
//  WeatherViewController.m
//  HQPaulo
//
//  Created by Paulo Correa on 21/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "TableViewDataSource.h"
#import "WeatherModel.h"
#import "WeatherViewModel.h"
#import "WeatherViewController.h"

static NSString * const HQCellIdentifier = @"CellIdentifier";

@interface WeatherViewController ()
@property (nonatomic, retain) WeatherViewModel *viewModel;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UILabel *labelSummary;
@property (nonatomic, strong) IBOutlet UILabel *labelMaxTemp;
@property (nonatomic, strong) IBOutlet UILabel *labelMinTemp;
@property (nonatomic, strong) IBOutlet UIImageView *imageWeather;
@property (nonatomic, strong) TableViewDataSource *tableViewDataSource;
@end

@implementation WeatherViewController
#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [self setupTableView];
    [self bindViewModel];
    [super viewDidLoad];
}

#pragma mark - Bind ViewModel
- (void)bindViewModel {
    self.labelMaxTemp.text = self.viewModel.maxTemp;
    self.labelMinTemp.text = self.viewModel.minTemp;
    self.labelSummary.text = self.viewModel.weather.summary;
    [self.imageWeather sd_setImageWithURL:self.viewModel.weather.weatherImgURL];
}

#pragma mark - UITableView Datasource
- (void)setupTableView {
    TableViewBlock tableViewBlock = ^(UITableViewCell *cell, WeatherModel *weather) {
        cell.textLabel.text = [self.viewModel weatherTextForWeather:weather];
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell.imageView sd_setImageWithURL:[weather weatherImgURL] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            [cell.imageView setImage:image];
            [cell setNeedsLayout];
        }];
    };
    
    self.tableViewDataSource = [[TableViewDataSource alloc] initCellIdentifier:HQCellIdentifier
                                                                 configureCell:tableViewBlock
                                                                         items:self.viewModel.forecast];
    [self.tableView setDataSource:self.tableViewDataSource];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:HQCellIdentifier];
    self.tableView.allowsSelection = NO;
    [self.view addSubview:self.tableView];
}

#pragma mark - Init
- (instancetype)initWithViewModel:(WeatherViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}
@end
