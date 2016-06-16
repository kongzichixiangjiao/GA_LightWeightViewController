//
//  Store.m
//  GA_LightWeightViewController
//
//  Created by houjianan on 16/6/16.
//  Copyright © 2016年 houjianan. All rights reserved.
//

#import "Store.h"
#import "BModel.h"
@implementation Store

+ (instancetype)store {
    return [[self alloc] init];
}

- (id)init {
    self = [super init];
    if (self) {
        [self readArchive];
    }
    return self;
}

- (void)readArchive {
    _bModels = [NSMutableArray array];
    for (int i = 0; i < 30; i++) {
        BModel* b = [[BModel alloc] init];
        b.name = [NSString stringWithFormat:@"name%d", i];
        b.picture = [NSString stringWithFormat:@"picture%d", i];
        b.date = [NSString stringWithFormat:@"date%d", i];
        [_bModels addObject:b];
    }
}

- (NSArray *)sortedPhotos {
    return _bModels;
    return [self.bModels sortedArrayUsingComparator:^NSComparisonResult(BModel* obj1, BModel* obj2) {
        return [obj1.date compare:obj2.date];
    }];
}

- (NSArray *)upData:(NSInteger)row {
    BModel* b = (BModel*)self.bModels[row];
    b.name = @"修改";
    return _bModels;
}

@end
