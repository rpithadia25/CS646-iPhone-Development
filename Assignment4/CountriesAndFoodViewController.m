//
//  FirstViewController.m
//  Assignment4
//
//  Created by Rakshit Pithadia on 10/19/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "CountriesAndFoodViewController.h"

@interface CountriesAndFoodViewController ()

@end

@implementation CountriesAndFoodViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Connect data
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"Food" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    self.countriesAndFood = dictionary;
    NSArray *components = [self.countriesAndFood allKeys];
    NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
    self.countries = sorted;
    
    //Load data for the first index by default
    NSString *selectFood = [self.countries objectAtIndex:0];
    self.food = [self.countriesAndFood objectForKey:selectFood];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == countryComponent) {
        return _countries.count;
    }
    return _food.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == countryComponent) {
        return _countries[row];
    }else{
        return _food[row];
    }

}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == countryComponent) {
        [self fetchFoodForCountry:row];
        [pickerView reloadComponent:foodComponent];
        [pickerView selectRow:0 inComponent:foodComponent animated:YES];
        [self setSliderValue];
    }else {
        [self setSliderValue];
    }
}

-(void)setSliderValue
{
   [self.sliderView setValue:[self.pickerView selectedRowInComponent:foodComponent] animated:YES];
}

- (void)fetchFoodForCountry:(NSInteger)row
{
    self.food = [NSArray new];
    NSString *selectFood = [self.countries objectAtIndex:row];
    self.food = [self.countriesAndFood objectForKey:selectFood];
}

//- (IBAction)sliderValueChanged:(id)sender
//{
//    self.sliderView.maximumValue = _food.count - 1;
//    [self.pickerView selectRow:self.sliderView.value inComponent:foodComponent animated:YES];
//    [self.pickerView reloadComponent: foodComponent];
//}


- (IBAction)sliderValueChanged:(id)sender
{
    self.sliderView.maximumValue = _food.count - 1;
    [self.pickerView selectRow:self.sliderView.value inComponent:foodComponent animated:YES];
    [self.pickerView reloadComponent: foodComponent];
}

@end
