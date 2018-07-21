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
}

- (void)updateViewConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [super updateViewConstraints];
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
    self.tableView.allowsSelection = NO;
    [self.view addSubview:self.tableView];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

@end
