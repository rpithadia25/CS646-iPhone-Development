//
//  PhoneNumber.h
//  Assignment2
//
//  Created by Rakshit Pithadia on 8/31/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhoneNumber : NSObject

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *type;

+ (id) type: (NSString *) phoneType number: (NSString *) number;
- (NSString *) number;
- (BOOL) isMobile;
- (BOOL) isLocal;
- (NSString *) description;


@end
