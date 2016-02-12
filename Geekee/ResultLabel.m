//
//  ResultLabel.m
//  Coolculator
//
//  Created by Cyril Saade on 2/11/16.
//  Copyright © 2016 Cyril Saade. All rights reserved.
//

#import "ResultLabel.h"

@implementation ResultLabel

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action
              withSender:(id)sender
{
    return (action == @selector(copy:));
}

- (void)copy:(id)sender {
    [[UIPasteboard generalPasteboard] setString:self.text];
}


@end
