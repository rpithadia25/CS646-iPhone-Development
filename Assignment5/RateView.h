//
//  RateView.h
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/16/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//  Reference: http://www.raywenderlich.com/1768/uiview-tutorial-for-ios-how-to-make-a-custom-uiview-in-ios-5-a-5-star-rating-view

#import <UIKit/UIKit.h>

@class RateView;

@protocol RateViewDelegate
- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating;
@end

@interface RateView : UIView

@property (strong, nonatomic) UIImage *notSelectedImage;
@property (strong, nonatomic) UIImage *halfSelectedImage;
@property (strong, nonatomic) UIImage *fullSelectedImage;
@property (nonatomic) float rating;
@property BOOL editable;
@property (strong) NSMutableArray * imageViews;
@property (nonatomic) int maxRating;
@property int midMargin;
@property int leftMargin;
@property CGSize minImageSize;
@property id <RateViewDelegate> delegate;

@end
