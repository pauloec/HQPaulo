//
//  TableViewDataSource.h
//  HQPaulo
//
//  Created by Paulo Correa on 20/07/18.
//  Copyright © 2018 HQ Travel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewBlock)(id cell, id item);

@interface TableViewDataSource : NSObject <UITableViewDataSource>
- (instancetype)initCellIdentifier:(NSString *)cellIdentifier configureCell:(TableViewBlock)cellBlock items:(NSArray *)items;
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
@property (nonatomic, copy) NSArray *items;
@end
