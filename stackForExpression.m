//
//  stackForExpression.m
//  Coolculator
//
//  Created by Cyril Saade on 2/11/16.
//  Copyright © 2016 Cyril Saade. All rights reserved.
//

#import "stackForExpression.h"

@implementation stackForExpression

-(id)init { // CONTRUCTOR
    
    if(self = [super init]) {
        values = [[NSMutableArray alloc]init];
        numberOfElements = 0;
    }
    return self;
}

-(void)push:(id)elementToPush {
    [values addObject:elementToPush];
    numberOfElements++;
}

-(id)pop {
    
    id lastObjectToPop = nil;
    if(numberOfElements > 0) {
        lastObjectToPop = [values objectAtIndex:([values count]-1)];
        [values removeLastObject];
        numberOfElements--;
    }
    return lastObjectToPop;
}

-(void)clear {
    
    [values removeAllObjects];
    numberOfElements =0;
}

@end
