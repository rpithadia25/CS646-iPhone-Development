//
//  NSString+PhoneFormat.m
//  Assignment2
//
//  Created by Rakshit Pithadia on 8/31/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "NSString+PhoneFormat.h"
#import "PhoneNumber.h"

@implementation NSString (PhoneFormat)


//Returns the input string in the format xxx-xxx-xxxx
-(NSString *) phoneFormat
{
    NSCharacterSet *phoneCharacters = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSString *phoneNumber = [[self componentsSeparatedByCharactersInSet:[phoneCharacters invertedSet]] componentsJoinedByString:@""];
    phoneNumber = [NSString stringWithFormat:@"%@-%@-%@",[phoneNumber substringToIndex:3],[phoneNumber substringWithRange:NSMakeRange(3, 3)],[phoneNumber substringWithRange:NSMakeRange(6, 4)]];
    return phoneNumber;
}

-(PhoneNumber *) asPhoneNumber
{
    @try{
        NSString *pattern = [NSString stringWithFormat:@"^[a-zA-Z \\s]*:\\s\\d{3}-\\d{3}-\\d{4}$"];
        NSRegularExpression *regex = [NSRegularExpression
                                      regularExpressionWithPattern:pattern
                                      options:NSRegularExpressionCaseInsensitive
                                      error:nil];
        
        BOOL num = [regex numberOfMatchesInString:self
                                          options:0
                                            range:NSMakeRange(0, [self length])];
        
        if (num)
        {
            NSMutableArray *substrings = [NSMutableArray new];
            NSScanner *scanner = [NSScanner scannerWithString:self];
            NSString *substring = nil;
            [scanner scanUpToString:@":" intoString:&substring];
            [substrings addObject:substring];
            while(![scanner isAtEnd]) {
                [scanner scanString:@":" intoString:nil]; // Scan the : character
                if([scanner scanUpToString:@" " intoString:&substring]) {
                    [substrings addObject:substring];
                }
            }
            return ([PhoneNumber type:substrings[0] number:substrings[1]]);
        }else{
            [NSException raise:@"Invalid format" format:@"Format of \"%@\" is invalid", self];
        }
    }
    @catch(NSException *e){
        NSLog(@"Exception: %@", e);
    }
    return nil;
}

@end
