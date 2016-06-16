//
//  Store.h
//  GA_LightWeightViewController
//
//  Created by houjianan on 16/6/16.
//  Copyright © 2016年 houjianan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject
@property(readonly, nonatomic, strong)NSMutableArray* bModels;

//初始化
+ (instancetype)store;
//获得数据
- (NSArray *)sortedPhotos;
//更得新数据
- (NSArray *)upData:(NSInteger)row;
@end
