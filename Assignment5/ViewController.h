//
//  ViewController.h
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/4/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Instructor.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate>
{
    
}

@property (strong, nonatomic) NSArray               * jsonResponse;
@property (strong, nonatomic) NSMutableArray        * professors;
@property (strong, nonatomic) NSMutableArray        * ids;
@property (strong, nonatomic) NSMutableArray        * office;
@property (strong, nonatomic) NSMutableArray        * phone;
@property (strong, nonatomic) NSMutableArray        * email;
@property (strong, nonatomic) NSMutableArray        * rating;
@property (strong, nonatomic) NSMutableArray        * comments;
@property (strong, nonatomic) IBOutlet UITableView  * tableView;

@end

