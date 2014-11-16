//
//  InstructorViewController.h
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/14/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstructorViewController : UIViewController

@property (strong, nonatomic) NSString * instructorId;
@property (strong, nonatomic) IBOutlet UILabel *instructorName;
@property (strong, nonatomic) IBOutlet UILabel *office;
@property (strong, nonatomic) IBOutlet UILabel *phone;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *rating;


@end
