//
//  TableViewDataSource.h
//  GA_LightWeightViewController
//
//  Created by houjianan on 16/6/16.
//  Copyright © 2016年 houjianan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

typedef void(^TableViewCellConfigureBlock)(id cell, id items);
typedef void(^ReloadTableViewBlock)(NSIndexPath* indexPath);

@interface TableViewDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
    reloadTableView:(ReloadTableViewBlock)aReloadTableView;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
- (void)upData:(NSArray *)model withIndexPath:(NSIndexPath *)indexPath;
@end
