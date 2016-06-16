//
//  AppDelegate.m
//  GA_LightWeightViewController
//
//  Created by houjianan on 16/6/16.
//  Copyright © 2016年 houjianan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (instancetype)shareDelegate {
    return [UIApplication sharedApplication].delegate;
}

/**
 *  store唯一性
 */
@synthesize store = _store;
- (Store *)store {
    if (_store == nil) {
        _store = [Store store];
    }
    return _store;
}

@end
