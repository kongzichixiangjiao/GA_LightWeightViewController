//
//  BCell+ConfigureForData.m
//  GA_LightWeightViewController
//
//  Created by houjianan on 16/6/16.
//  Copyright © 2016年 houjianan. All rights reserved.
//

#import "BCell+ConfigureForData.h"
#import "BModel.h"
@implementation BCell (ConfigureForData)

- (void)configureForPhoto:(BModel *)b {
    self.textLabel.text = b.name;
}

@end
