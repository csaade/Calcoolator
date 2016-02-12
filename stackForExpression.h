//
//  stackForExpression.h
//  Calcoolator
//
//  Created by Cyril Saade on 2/11/16.
//  Copyright © 2016 Cyril Saade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface stackForExpression : NSObject {
    
    NSMutableArray* values;
    int numberOfElements;
}
- (void)push:(id)elementToPush;

- (id)pop;

-(void)clear;

@end
