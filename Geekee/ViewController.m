//
//  ViewController.m
//  Coolculator
//
//  Created by Cyril Saade on 2/4/16.
//  Copyright © 2016 Cyril Saade. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize InputField,ResultField;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ResultField.text = @"0";
    
    self.ToEvaluate = [[NSString alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)calculate:(NSString*)EvalThis {
    
    @try {
        NSExpression * expression = [NSExpression expressionWithFormat:EvalThis];
        NSNumber * result = [expression expressionValueWithObject:nil context:nil];
        return [result stringValue];
    }
    @catch (NSException *exception) {
        return @"Error";
    }
    
}

-(BOOL) checkIfParenthesisBalanced:(NSString*)EvalThis {
    
    stackForExpression * theStack = [[stackForExpression alloc]init]; //initilize the stack
    
    for (int i=0; i<EvalThis.length; i++) {
        
        if([EvalThis characterAtIndex:i] == '(')
            [theStack push:@"("];
        else if([EvalThis characterAtIndex:i] == ')') {
            NSString * elem = [theStack pop];
            if(![elem  isEqual: @"("])
                return NO;
        }
    
    }

    if([theStack pop] == nil)
        return YES;
    else
        return NO;

}

- (IBAction)ButtonPressed:(id)sender {
    
    UIButton * pressed = (UIButton*)sender; //C-style casting to a UIButton
    
    char previousElementInExpression = [self.ToEvaluate characterAtIndex:self.ToEvaluate.length-1]; // gets the previous character inside the NSString (this value is used for sqrt and parenthesis)
    
    NSString * selectedNumber = [[NSString alloc]init];
    
    switch (pressed.tag) {
        case 10: // AC button pressed
            self.InputField.text = @"";
            self.ToEvaluate = @"";
            self.ResultField.text = @"0";
            
            self.isDecimal = NO;
            break;
        case 11: //EXE selected
            
            if([self checkIfParenthesisBalanced:self.ToEvaluate])
                self.ResultField.text = [self calculate:self.ToEvaluate]; // if parenthesis are balanced, it calculates
            else self.ResultField.text = @"Check parentheses"; // displays an error
            
            self.isDecimal = NO;
            break;
            
        case 12: // ( selected
            
            self.InputField.text = [self.InputField.text stringByAppendingString:[pressed currentTitle]];
            
            if(((previousElementInExpression != '*') && (previousElementInExpression != '/') && (previousElementInExpression != '+') && (previousElementInExpression != '-')) && (self.ToEvaluate.length > 0)) {
                self.ToEvaluate = [self.ToEvaluate stringByAppendingString:@"*("];
            }
            else
                self.ToEvaluate = [self.ToEvaluate stringByAppendingString:@"("];
            self.isDecimal = NO;
            break;
        case 19: //Square root
            
            self.InputField.text = [self.InputField.text stringByAppendingString:[pressed.currentTitle stringByAppendingString:@"("]];
            
            if(((previousElementInExpression != '*') && (previousElementInExpression != '/') && (previousElementInExpression != '+') && (previousElementInExpression != '-')) && (self.ToEvaluate.length >0)) {
                self.ToEvaluate = [self.ToEvaluate stringByAppendingString:@"*sqrt("];
            }
            else {
                self.ToEvaluate = [self.ToEvaluate stringByAppendingString:@"sqrt("];
            }

            self.isDecimal = NO;
            break;
            
        case 16: //multiplication
            self.InputField.text = [self.InputField.text stringByAppendingString:pressed.currentTitle];
            self.ToEvaluate = [self.ToEvaluate stringByAppendingString:@"*"];
            self.isDecimal = NO;
            break;
            
        case 15: //division
            if(!self.isDecimal && [self.ToEvaluate characterAtIndex:self.ToEvaluate.length-1] != ')') // if number is not a decimal
                self.ToEvaluate = [self.ToEvaluate stringByAppendingString:@".0/"]; //performs floating point division if it is an integer
            else
                self.ToEvaluate = [self.ToEvaluate stringByAppendingString:@"/"];
            
            self.InputField.text = [self.InputField.text stringByAppendingString:@"/"];
            
            self.isDecimal = NO;
            break;
        
        case 13:
            self.InputField.text = [self.InputField.text stringByAppendingString:pressed.currentTitle];
            self.ToEvaluate = [self.ToEvaluate stringByAppendingString:pressed.currentTitle];
            self.isDecimal = NO;
            break;
            
        case 14: // . selected
            self.InputField.text = [self.InputField.text stringByAppendingString:pressed.currentTitle];
            self.ToEvaluate = [self.ToEvaluate stringByAppendingString:pressed.currentTitle];
            selectedNumber = [selectedNumber stringByAppendingString:@"."];
            self.isDecimal = YES;
            
            break;
            
        case 17:
            self.InputField.text = [self.InputField.text stringByAppendingString:pressed.currentTitle];
            self.ToEvaluate = [self.ToEvaluate stringByAppendingString:pressed.currentTitle];
            self.isDecimal = NO;
            break;
            
        case 18:
            self.InputField.text = [self.InputField.text stringByAppendingString:pressed.currentTitle];
            self.ToEvaluate = [self.ToEvaluate stringByAppendingString:pressed.currentTitle];
            
            self.isDecimal = NO;
            break;
            
        default: //if a number is pressed
            self.InputField.text = [self.InputField.text stringByAppendingString:pressed.currentTitle];
            self.ToEvaluate = [self.ToEvaluate stringByAppendingString:pressed.currentTitle];
            
            break;
    }
    
    
    
}
@end
