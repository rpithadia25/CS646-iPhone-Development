//
//  PhoneNumber.m
//  Assignment2
//
//  Created by Rakshit Pithadia on 8/31/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "PhoneNumber.h"
#import "NSString+PhoneFormat.h"

@interface Person : NSObject
{
    NSString * fullName;
    int age;
}

@end

@implementation PhoneNumber


//Creates a new Phone object with given data.
+ (id) type: (NSString *) phoneType number: (NSString *) number
{
    PhoneNumber *phoneNumber = [PhoneNumber new];
    phoneNumber.type = phoneType;
    phoneNumber.number = number;
    return phoneNumber;
}


//Returns the phone number formatted as in problem 1.
- (NSString *) number
{
    return [_number phoneFormat];
}


//Returns true if the phone number is for a mobile phone.
-(BOOL) isMobile
{
    if ([_type isEqual:mobile]) {
        return TRUE;
    }
    return FALSE;
}


//Returns true if the phone number has the area code 619 or 858.
-(BOOL) isLocal
{
    NSString *areaCode = [_number substringToIndex:3];
    if([areaCode  isEqual: @"619"] || [areaCode  isEqual: @"858"]){
        return TRUE;
    }
    return FALSE;
}


//Returns a string description of the phone number in the format "type: number".
-(NSString *) description
{
    NSString *desc = [NSString stringWithFormat:@"%@: %@",_type,_number];
    return desc;
}

@end
