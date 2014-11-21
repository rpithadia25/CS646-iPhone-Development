//
//  RatingTableViewCell.h
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/19/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"

@interface RatingTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet RateView *rating;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;

@end
