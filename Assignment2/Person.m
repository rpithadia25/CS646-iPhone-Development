//
//  Person.m
//  Assignment2
//
//  Created by Rakshit Pithadia on 9/9/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "Person.h"
#import "NSString+PhoneFormat.h"

@implementation Person

//Creates a new Person object with given data
+ (id) firstName: (NSString *) firstName lastName: (NSString *) lastName
{
    Person *person = [Person new];
    person.firstName = firstName;
    person.lastName = lastName;
    return person;
}

//Adds a phone number
- setPhoneNumber: (PhoneNumber *) number
{
    if (_phoneNumbers == nil) {
        _phoneNumbers = [NSMutableArray new];
    }
    [_phoneNumbers addObject: number];
    return nil;
}

//Returns full name of the person, (FirstName LastName)
- (NSString*) description
{
    return [NSString stringWithFormat:@"%@ %@",_firstName,_lastName];
}

//Returns the person's phone number of the given type. Or nil if number does not exist
- (NSString *) phoneNumber: (NSString *) phoneType
{
    PhoneNumber *number = [PhoneNumber new];
    for (int i = 0; i < _phoneNumbers.count; i++) {
        number = [_phoneNumbers objectAtIndex:i];
        if ([phoneType isEqual:(number.type)]) {
            return number.number;
        }
    }
    return nil;
}

//Returns true if person has given phoneNumber
- (BOOL) hasNumber: (NSString *) phoneNumber
{
    for (int i = 0 ; i < _phoneNumbers.count; i++) {
        if ([([[_phoneNumbers objectAtIndex:i] number]) isEqual:phoneNumber]) {
            return TRUE;
        }
    }
    return FALSE;
}

- (NSComparisonResult)compare:(Person *) aPerson
{
    NSComparisonResult bar = [self.lastName compare:aPerson.lastName];
    if (bar == NSOrderedSame) {
        bar = [self.firstName compare:aPerson.firstName];
    }
    return bar;
}

@end
