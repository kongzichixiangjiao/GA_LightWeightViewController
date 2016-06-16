//
//  ViewController.m
//  GA_LightWeightViewController
//
//  Created by houjianan on 16/6/16.
//  Copyright © 2016年 houjianan. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDataSource.h"
#import "BCell.h"
#import "BCell+ConfigureForData.h"
#import "BModel.h"
#import "Store.h"
#import "AppDelegate.h"
//cell的Identifier
static NSString * const BCellIdentifier = @"BCell";

@interface ViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//将tableview的数据源处理分离出一个类
@property (nonatomic, strong) TableViewDataSource *photosArrayDataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //cellBlock
    TableViewCellConfigureBlock cellBlock = ^(BCell* cell, BModel* model) {
        //显示数据方法从cell类分离出来
        [cell configureForPhoto:model];
    };
    //刷新block
    ReloadTableViewBlock reloadTableViewBlock = ^(NSIndexPath *indexPath) {
//        [self.tableView reloadData];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    };
    
    //获取数据
    NSArray* models = [AppDelegate shareDelegate].store.sortedPhotos;
    //初始化TableViewDataSource
    self.photosArrayDataSource = [[TableViewDataSource alloc] initWithItems:models cellIdentifier:BCellIdentifier configureCellBlock: cellBlock reloadTableView:reloadTableViewBlock];
    //****
    self.tableView.dataSource = self.photosArrayDataSource;
    //初测cell
    [self.tableView registerNib:[BCell nib] forCellReuseIdentifier:BCellIdentifier];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)reload:(id)sender {
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
    //获得新数据
    NSArray* upDataModel = [[AppDelegate shareDelegate].store upData:indexPath.row];
    //传入刷新数据
    [self.photosArrayDataSource upData:upDataModel withIndexPath:indexPath];
}

@end
