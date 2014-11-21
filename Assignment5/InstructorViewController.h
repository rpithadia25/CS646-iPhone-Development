//
//  InstructorViewController.h
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/4/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Instructor.h"
#import "RateViewController.h"

@interface InstructorViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, RatingViewDelegate>

@property Instructor                                *instructor;
@property NSMutableArray                            *instructorData;
@property NSMutableArray                            *commentsData;
@property (strong, nonatomic) NSString              *instructorId;
@property (strong, nonatomic) IBOutlet UITableView  *tableView;

-(void) populateTableData;

@end
