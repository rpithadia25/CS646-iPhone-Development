//
//  ViewController.h
//  Assignment3
//
//  Created by Rakshit Pithadia on 10/1/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)updateButtonPressed:(id)sender;
- (IBAction)hideKeyboard;

@property (strong, nonatomic) IBOutlet UITextField *inputText;
@property (strong, nonatomic) IBOutlet UITextField *x;
@property (strong, nonatomic) IBOutlet UITextField *y;
@property (strong, nonatomic) IBOutlet UILabel *movingLabel;

@end

