//
//  RateViewController.h
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/19/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"
#import "Instructor.h"

@protocol RatingViewDelegate
- (void)RateViewWasDismissedWithValue:(NSInteger) value;
- (void)RateViewWasDismissed;
@end

@interface RateViewController : UIViewController<RateViewDelegate>

@property Instructor *instructor;
@property NSInteger rating;
@property id <RatingViewDelegate> delegate;
@property NSString *instructorName;
@property (strong, nonatomic) IBOutlet RateView *rateView;
- (id)initWithInstructorName:(NSString *)instructorName delegate:(id <RatingViewDelegate>) delegate;
- (void)show;
- (IBAction)dismissAction:(id)sender;

@end
