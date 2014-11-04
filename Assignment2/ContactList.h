//
//  ContactList.h
//  Assignment2
//
//  Created by Rakshit Pithadia on 9/9/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface ContactList : NSObject

@property (strong, nonatomic) NSMutableArray *contactList;

- (void) addPerson: (Person *) newContact;
- (NSArray *) orderedByName;
- (NSArray *) phoneNumberFor: (NSString *) lastName;
- (NSString *) nameForNumber: (NSString *) phoneNumber;

@end
