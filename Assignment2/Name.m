//
//  Name.m
//  Assignment2
//
//  Created by Rakshit Pithadia on 9/8/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "Name.h"

@implementation Name

//Creates a new Name object with given data
+ (id) firstName: (NSString *) firstName lastName: (NSString *) lastName
{
    Name *name = [Name new];
    name.firstName = firstName;
    name.lastName = lastName;
    return name;
}

//Returns full name of the person, (FirstName LastName)
- (NSString*) description
{
    return [NSString stringWithFormat:@"%@ %@",_firstName,_lastName];
}

//Returns an NSComparisonResult indicating how the two names compare in order.
- (NSComparisonResult)compare:(Name *) aName
{
    NSComparisonResult bar = [self.lastName compare:aName.lastName];
    if (bar == NSOrderedSame) {
        bar = [self.firstName compare:aName.firstName];
    }
    return bar;
}

@end
