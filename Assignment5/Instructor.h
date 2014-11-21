//
//  Instructor.h
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/4/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Instructor : NSObject

@property (strong, nonatomic) NSString        * instructorId;
@property (strong, nonatomic) NSString        * firstName;
@property (strong, nonatomic) NSString        * lastName;
@property (strong, nonatomic) NSString        * office;
@property (strong, nonatomic) NSString        * phone;
@property (strong, nonatomic) NSString        * email;
@property (strong, nonatomic) NSDictionary    * rating;

@property NSNumber *averageRating;
@property NSInteger totalRatings;

-(NSString *)fullName;

@end
