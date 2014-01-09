//
//  Model.m
//  1.1.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Model.h"

@implementation Model

static Model *instance;

-(void)addProduct:(id)Product{
    [self.data addObject:Product];
}
-(void)removeProductAt:(int)index{
    [self.data removeObjectAtIndex:index];
}

-(id)productAt:(int)productId{
    return [self.data objectAtIndex:productId];
}

-(int)numberOfProduct{
    return (int)[self.data count];
}

+(Model *)sharedModel{
    if (nil == instance)
        instance = [[Model alloc] init];
    return instance;
}

-(id)init{
    self = [super init];
    if (self) {
        self.data = [[NSMutableArray alloc] initWithObjects:@"iPhone", @"iPod", @"MacBook Air", @"MacBook Pro", @"MacBook Pro Retina", @"iMac", @"MacPro", nil];
    }
    return self;
}

@end
