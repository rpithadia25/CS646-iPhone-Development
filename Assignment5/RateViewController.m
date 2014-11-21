//
//  RateViewController.m
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/19/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "RateViewController.h"

@interface RateViewController ()

@end

@implementation RateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rateView setMaxRating:5];
    [self.rateView setEditable:YES];
    self.rateView.delegate = self;
    self.title = self.instructorName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithInstructorName:(NSString *)instructorName delegate:(id<RatingViewDelegate>)delegate {
    if (self = [super init]) {
        _delegate = delegate;
        _instructorName = instructorName;
    }
    return self;
}

-(void)show {
    id appDelegate = [[UIApplication sharedApplication] delegate];
    UIWindow *window = [appDelegate window];
    [window addSubview:self.view];
    self.view.frame = window.frame;
    self.view.center = window.center;
}

- (IBAction)dismissAction:(id)sender
{
    NSString *buttonName = ((UIButton*) sender).titleLabel.text;
    if([buttonName isEqualToString:@"Set Rating"] && self.rating != 0)
    {
        [self.delegate RateViewWasDismissedWithValue: self.rating];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)rateView:(RateView *)rateView ratingDidChange:(float)rating
{
    self.rating = [[[NSNumber alloc]initWithInt:(int)rating] floatValue];
}

@end
