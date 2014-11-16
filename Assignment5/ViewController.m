//
//  ViewController.m
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/4/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "ViewController.h"
#import "Instructor.h"
#import "InstructorViewController.h"

@interface ViewController ()
{
//    NSMutableArray *filteredNames;
//    UISearchDisplayController *searchController;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //Instructor *instructor = [Instructor new];
    self.professors = [[NSMutableArray alloc]init];
   // self.ids = [[NSMutableArray alloc]init];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:
                               @"http://bismarck.sdsu.edu/rateme/list"]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                self.jsonResponse = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &error];
                
                for (NSDictionary *dict in self.jsonResponse) {
                    NSInteger ids = [[dict valueForKey:@"id"] integerValue];
                    NSString *firstName = [dict valueForKey:@"firstName"];
                    NSString *lastName = [dict valueForKey:@"lastName"];
                    NSString *fullName = [NSString stringWithFormat: @"%@ %@", firstName, lastName];
                    
//                    instructor.instructorId = [dict valueForKey:@"id"];
//                    instructor.firstName = [dict valueForKey:@"firstName"];
//                    instructor.lastName = [dict valueForKey:@"lastName"];
                    [self.professors addObject: [NSString stringWithFormat: @"%@ %@", firstName, lastName]];
//                    [NSString stringWithFormat: @"%@ %@", instructor.firstName, instructor.lastName]
                    
                    //[self.ids addObject: [NSNumber numberWithInteger:ids]];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }] resume];

//    filteredNames = [NSMutableArray array];
//    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0,320,44)];
//    self.tableView.tableHeaderView = searchBar;
//    searchController = [[UISearchDisplayController alloc]initWithSearchBar:searchBar contentsController:self];
//    searchController.delegate = self;
//    searchController.searchResultsDataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    cell.textLabel.text = self.professors[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
}

#pragma mark Fetch Json

-(Instructor *) fetchDataUsingId: (NSIndexPath *)instructorId
{
    Instructor *instructor = [Instructor new];
    NSString *url = [NSString stringWithFormat:@"http://bismarck.sdsu.edu/rateme/instructor/%ld", (long)instructorId.row];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                self.jsonResponse = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &error];
                
                instructor.office = [self.jsonResponse valueForKey:@"office"];
                instructor.phone = [self.jsonResponse valueForKey:@"phone"];
                instructor.email = [self.jsonResponse valueForKey:@"email"];
                instructor.rating = [self.jsonResponse valueForKey:@"rating"];
                instructor.firstName = [self.jsonResponse valueForKey:@"firstName"];
                instructor.lastName = [self.jsonResponse valueForKey:@"lastName"];
            }] resume];
    return instructor;
}

#pragma mark Segue method

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //Instructor *currentInstructor = [self fetchDataUsingId:indexPath];
    if ([[segue identifier] isEqualToString:@"instructorDetails"]) {
        
        InstructorViewController *viewController = (InstructorViewController *)segue.destinationViewController;
        viewController.instructorId = [self.tableView indexPathForSelectedRow];
        
    }
}



@end
