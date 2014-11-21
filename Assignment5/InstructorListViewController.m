//
//  InstructorListViewController.m
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/4/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "InstructorListViewController.h"
#import "Instructor.h"
#import "InstructorViewController.h"

@interface InstructorListViewController ()

@end

@implementation InstructorListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.professors = [[NSMutableArray alloc]init];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:
                               @"http://bismarck.sdsu.edu/rateme/list"]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                self.jsonResponse = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &error];
                
                for (NSDictionary *dict in self.jsonResponse) {
                    NSString *instructorId = [dict valueForKey:@"id"];
                    NSString *firstName = [dict valueForKey:@"firstName"];
                    NSString *lastName = [dict valueForKey:@"lastName"];
                    Instructor *instructor = [Instructor new];
                    instructor.firstName = firstName;
                    instructor.lastName = lastName;
                    instructor.instructorId = instructorId;
                    [self.professors addObject:instructor];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }] resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.professors count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Cell = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    cell.textLabel.text = [self.professors[indexPath.row] fullName];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark Segue method

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSString *instructorId = [NSString stringWithFormat:@"%ld", (long)indexPath.row + 1];
    if ([[segue identifier] isEqualToString:@"instructorListToDetail"]) {
        
        InstructorViewController *viewController = (InstructorViewController *)segue.destinationViewController;
        viewController.instructorId = instructorId;
        viewController.instructor = self.professors[indexPath.row];
    }
}

@end
