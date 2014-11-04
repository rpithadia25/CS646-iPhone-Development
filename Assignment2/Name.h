//
//  Name.h
//  Assignment2
//
//  Created by Rakshit Pithadia on 9/8/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Name : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;

+ (id) firstName: (NSString *) firstName lastName: (NSString *) lastName;
- (NSString*) description;
- (NSComparisonResult)compare:(Name *) aName;

@end
