//
//  TableViewDataSource.m
//  GA_LightWeightViewController
//
//  Created by houjianan on 16/6/16.
//  Copyright © 2016年 houjianan. All rights reserved.
//

#import "TableViewDataSource.h"

@interface TableViewDataSource()
@property(nonatomic, strong)NSArray* items;
@property(nonatomic, copy)NSString* cellIdentifier;
@property(nonatomic, copy)TableViewCellConfigureBlock configureCellBlock;
@property(nonatomic, copy)ReloadTableViewBlock reloadTableView;
@end

@implementation TableViewDataSource


- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock reloadTableView:(ReloadTableViewBlock)aReloadTableView {
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.reloadTableView = [aReloadTableView copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id item = self.items[indexPath.row];
    self.configureCellBlock(cell, item);
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)upData:(NSArray *)model withIndexPath:(NSIndexPath *)indexPath {
    //修改数据
    self.items = model;
    //去刷新
    self.reloadTableView(indexPath);
}




@end
