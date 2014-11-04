//
//  ContactList.m
//  Assignment2
//
//  Created by Rakshit Pithadia on 9/9/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

//Add a Person object to the list
- (void) addPerson: (Person *) newContact
{
    if (_contactList == nil) {
        _contactList = [NSMutableArray new];
    }
    [_contactList addObject:newContact];
}

//Returns an NSArray of all your contacts ordered by last name
- (NSArray *) orderedByName
{
    NSArray* sorted = [_contactList sortedArrayUsingSelector:@selector(compare:)];
    return sorted;
}

//Given the lastName return phone numbers for the first person in the list that has that last name.
//Return an empty array if no such person exists.
- (NSArray *) phoneNumberFor: (NSString *) lastName
{
    Person *person = [Person new];
    for (int i =0 ; i < _contactList.count; i++) {
        person = [_contactList objectAtIndex:i];
        if (person.lastName == lastName) {
            return person.phoneNumbers;
        }
    }
    return nil;
}

//Return the full name of the person with the given phone number.
//Return nil if no one has the phone number.
- (NSString *) nameForNumber: (NSString *) phoneNumber
{
    Person *person = [Person new];
    for (int i = 0; i < _contactList.count; i++) {
        person = [_contactList objectAtIndex:i];
        if ([person hasNumber: phoneNumber] ) {
            return [NSString stringWithFormat:@"%@ %@",person.firstName, person.lastName];
        }
    }
    return nil;
}

@end
