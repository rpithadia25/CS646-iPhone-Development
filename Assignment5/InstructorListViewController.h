//
//  InstructorListViewController.h
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/4/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstructorListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray               * jsonResponse;
@property (strong, nonatomic) NSMutableArray        * professors;
@property (strong, nonatomic) IBOutlet UITableView  * tableView;

@end

