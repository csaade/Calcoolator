//
//  ViewController.h
//  Calcoolator
//
//  Created by Cyril Saade on 2/4/16.
//  Copyright © 2016 Cyril Saade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "stackForExpression.h"

@interface ViewController : UIViewController

//Detects when button on the calculator is pressed
- (IBAction)ButtonPressed:(id)sender;
-(BOOL) checkIfParenthesisBalanced:(NSString*)EvalThis;
-(NSString*)calculate:(NSString*)EvalThis;

@property (strong, nonatomic) IBOutlet UILabel *InputField;
@property (strong, nonatomic) IBOutlet UILabel *ResultField;
@property(strong,nonatomic) NSString* ToEvaluate;
@property(nonatomic, assign) BOOL isDecimal;

/*tags:

 AC = 10
 EXE = 11
 ( = 12
 ) = 13
 . = 14
 / = 15
 x = 16
 - = 17
 + = 18
 sqrt = 19
 
*/
@end

