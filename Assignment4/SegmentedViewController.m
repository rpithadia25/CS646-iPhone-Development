//
//  SegmentedViewController.m
//  Assignment4
//
//  Created by Rakshit Pithadia on 10/29/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "SegmentedViewController.h"

@interface SegmentedViewController ()

@end

@implementation SegmentedViewController

- (void)viewDidLoad
{
    self.textView.hidden = YES;
    self.alertButton.hidden = YES;
    self.doneEditing.hidden = YES;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchChanged:(id)sender
{
    if (self.activityIndicatorSwitch.isOn == YES) {
        [self.activityIndicator startAnimating];
    }else{
        [self.activityIndicator stopAnimating];
    }
}

- (IBAction)indexChanged:(UISegmentedControl *)sender
{
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            self.textView.hidden = YES;
            self.doneEditing.hidden = YES;
            self.alertButton.hidden = YES;
            self.activityIndicator.hidden = NO;
            self.activityIndicatorSwitch.hidden = NO;
            break;
        case 1:
            self.textView.hidden = NO;
            self.doneEditing.hidden = NO;
            self.alertButton.hidden = YES;
            self.activityIndicator.hidden = YES;
            self.activityIndicatorSwitch.hidden = YES;
            
            //Set the background color to grey so that textView is visible
            self.textView.backgroundColor = [UIColor grayColor];
            break;
        case 2:
            self.alertButton.hidden = NO;
            self.activityIndicator.hidden = YES;
            self.activityIndicatorSwitch.hidden = YES;
            self.textView.hidden = YES;
            self.doneEditing.hidden = YES;
            break;
            
        default:
            break;
    }
}

- (IBAction)buttonClicked
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert!"                                                      message:@"Do you like the iPhone?"
        delegate:nil
        cancelButtonTitle:@"YES"
        otherButtonTitles:nil];
    
    [message show];
}

//Hides the keyboard
- (IBAction)doneEditing:(id)sender
{
    [self.textView resignFirstResponder];
}

@end
