//
//  CountryViewController.m
//  HQPaulo
//
//  Created by Paulo Correa on 20/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>
#import "TableViewDataSource.h"
#import "CountryModel.h"
#import "CountryViewController.h"
#import "CityViewModel.h"
#import "CityViewController.h"

static NSString * const HQCellIdentifier = @"CellIdentifier";

@interface CountryViewController () <UITableViewDelegate>
@property (nonatomic, weak) CountryViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TableViewDataSource *tableViewDataSource;
@end

@implementation CountryViewController
#pragma mark - View Lifecycle
- (void)viewDidLoad {
    self.title = @"Countries";
    [self setupTableView];
    [super viewDidLoad];
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
- (instancetype)initWithViewModel:(CountryViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return self;
}

#pragma mark - UITableView Datasource
- (void)setupTableView {
    TableViewBlock tableViewBlock = ^(UITableViewCell *cell, CountryModel *country) {
        cell.textLabel.text = country.name;
        [cell.imageView sd_setImageWithURL:[country flagImageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            [cell.imageView setImage:image];
            [cell setNeedsLayout];
        }];
    };
    
    self.tableViewDataSource = [[TableViewDataSource alloc] initCellIdentifier:HQCellIdentifier
                                                                 configureCell:tableViewBlock
                                                                         items:self.viewModel.countries];
    [self.tableView setDataSource:self.tableViewDataSource];
    [self.tableView setDelegate:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:HQCellIdentifier];
    self.tableView.allowsSelection = YES;
    [self.view addSubview:self.tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CountryModel *country = [self.viewModel.countries objectAtIndex:indexPath.row];
    NSArray *cities = country.cities;
    CityViewModel *cityViewModel = [[CityViewModel alloc] initWithCities:cities];
    CityViewController *cityViewController = [[CityViewController alloc] initWithViewModel:cityViewModel];
    [cityViewController setTitle:country.name];
    [self.navigationController pushViewController:cityViewController animated:YES];
}

@end
