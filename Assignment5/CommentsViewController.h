//
//  CommentsViewController.h
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/19/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Instructor.h"

@interface CommentsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property Instructor *instructor;
@property NSMutableArray * commentsData;
@property (strong, nonatomic) IBOutlet UITextView *textView;

-(IBAction)addComment;

@end
