//
//  SegmentedViewController.h
//  Assignment4
//
//  Created by Rakshit Pithadia on 10/29/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentedViewController : UIViewController<UITextViewDelegate>

- (IBAction)doneEditing:(id)sender;

@property (strong, nonatomic) IBOutlet UISegmentedControl       *segmentedControl;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView  *activityIndicator;
@property (strong, nonatomic) IBOutlet UISwitch                 *activityIndicatorSwitch;
@property (strong, nonatomic) IBOutlet UITextView               *textView;
@property (strong, nonatomic) IBOutlet UIButton                 *alertButton;
@property (strong, nonatomic) IBOutlet UIButton                 *doneEditing;

@end
