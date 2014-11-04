//
//  Person.h
//  Assignment2
//
//  Created by Rakshit Pithadia on 9/9/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhoneNumber.h"
#import "NSString+PhoneFormat.h"

@interface Person : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSMutableArray *phoneNumbers;

+ (id) firstName: (NSString *) firstName lastName: (NSString *) lastName;
- setPhoneNumber: (PhoneNumber *) number;
- (NSString*) description;
- (NSString *) phoneNumber: (NSString *) phoneType;
- (BOOL) hasNumber: (NSString *) phoneNumber;

@end
