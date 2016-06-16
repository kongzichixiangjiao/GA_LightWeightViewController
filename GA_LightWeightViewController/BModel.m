//
//  BModel.m
//  GA_LightWeightViewController
//
//  Created by houjianan on 16/6/16.
//  Copyright © 2016年 houjianan. All rights reserved.
//

#import "BModel.h"

static NSString* const Name = @"name";
static NSString* const Picture = @"picture";
static NSString* const Date = @"date";

@interface BModel() <NSCoding>

@end

@implementation BModel

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectOfClass:[NSString class] forKey:Name];
        self.picture = [aDecoder decodeObjectOfClass:[NSString class] forKey:Picture];
        self.date = [aDecoder decodeObjectOfClass:[NSString class] forKey:Date];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:Name];
    [aCoder encodeObject:self.picture forKey:Picture];
    [aCoder encodeObject:self.date forKey:Date];
}


@end
