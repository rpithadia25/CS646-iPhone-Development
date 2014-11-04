//
//  FirstViewController.h
//  Assignment4
//
//  Created by Rakshit Pithadia on 10/19/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>

#define countryComponent 0
#define foodComponent    1

@interface CountriesAndFoodViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UISlider *sliderView;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSDictionary * countriesAndFood;
@property (strong, nonatomic) NSArray * countries;
@property (strong, nonatomic) NSArray * food;

@end

