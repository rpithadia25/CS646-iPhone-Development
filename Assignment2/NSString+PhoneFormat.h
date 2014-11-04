//
//  NSString+PhoneFormat.h
//  Assignment2
//
//  Created by Rakshit Pithadia on 8/31/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhoneNumber.h"

@interface NSString (PhoneFormat)

-(NSString *)phoneFormat;
-(PhoneNumber *)asPhoneNumber;

@end
