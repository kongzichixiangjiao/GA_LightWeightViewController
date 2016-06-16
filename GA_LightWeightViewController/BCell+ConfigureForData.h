//
//  BCell+ConfigureForData.h
//  GA_LightWeightViewController
//
//  Created by houjianan on 16/6/16.
//  Copyright © 2016年 houjianan. All rights reserved.
//

#import "BCell.h"

@class BModel;

@interface BCell (ConfigureForData)

//处理数据的方法
- (void)configureForPhoto:(BModel *)b;

@end
