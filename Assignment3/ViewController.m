//
//  ViewController.m
//  Assignment3
//
//  Created by Rakshit Pithadia on 10/1/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    //Load defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *textFieldValue = [defaults objectForKey:@"textField"];
    NSString *xCoordinateValue = [defaults objectForKey:@"xCoordinate"];
    NSString *yCoordinateValue = [defaults objectForKey:@"yCoordinate"];
    
    self.inputText.text = textFieldValue;
    self.x.text = xCoordinateValue;
    self.y.text = yCoordinateValue;
    
    self.movingLabel.userInteractionEnabled = YES;
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(labelDragged:)];
    [self.movingLabel addGestureRecognizer:gesture];
    
    [super viewDidLoad];
}


//Helper to move Label
- (void)labelDragged:(UIPanGestureRecognizer *)gesture
{
    UILabel *label = (UILabel *)gesture.view;
    CGPoint translation = [gesture translationInView:label];
    
    // Move label
    label.center = CGPointMake(label.center.x + translation.x,
                               label.center.y + translation.y);
    
    // Update X and Y coordinates in respective text fields
    self.x.text = [NSString stringWithFormat:@"%d", (int)roundf(self.movingLabel.frame.origin.x)];
    self.y.text = [NSString stringWithFormat:@"%d", (int)roundf(self.movingLabel.frame.origin.y)];
    
    // Reset translation
    [gesture setTranslation:CGPointZero inView:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Displays the UILabel at the specified coordinates
- (IBAction)updateButtonPressed:(id)sender {
    
    [self hideKeyboard];
    
    if (([self.x.text isEqual: @"0"] || self.x.text.length == 0) ||
        ([self.y.text isEqual: @"0"] || self.y.text.length == 0))
    {
        self.movingLabel.text = self.inputText.text;
    }
    else
    {
        self.movingLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.movingLabel.frame = CGRectMake([self.x.text integerValue], [self.y.text integerValue], 375, 30);
        self.movingLabel.text = self.inputText.text;
    }
    
}

- (IBAction)hideKeyboard
{
    [self.inputText resignFirstResponder];
    [self.x resignFirstResponder];
    [self.y resignFirstResponder];
}

@end
