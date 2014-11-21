//
//  InstructorViewController.m
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/4/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//  Reference: http://www.raywenderlich.com/67081/cookbook-using-nsurlsession  for Rating and Comments

#import "InstructorViewController.h"
#import "RatingTableViewCell.h"
#import "RateViewController.h"
#import "CommentsViewController.h"

@interface InstructorViewController ()

@end

@implementation InstructorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.rowHeight = 44;
    self.instructorData = [[NSMutableArray alloc]init];
    self.commentsData = [[NSMutableArray alloc]init];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSString *url = [NSString stringWithFormat:@"http://bismarck.sdsu.edu/rateme/instructor/%@", self.instructorId];
    
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &error];
                
                NSString *office = [jsonResponse objectForKey:@"office"];
                NSString *phone = [jsonResponse objectForKey:@"phone"];
                NSString *email = [jsonResponse objectForKey:@"email"];
                NSDictionary *totalRating = [jsonResponse objectForKey:@"rating"];
                NSNumber *averageRating = [NSNumber numberWithFloat:[[totalRating objectForKey:@"average"] floatValue]];
                NSInteger totalRatings = [[totalRating objectForKey:@"totalRatings"] integerValue];
                
                [self.instructor setOffice:office];
                [self.instructor setPhone:phone];
                [self.instructor setEmail:email];
                [self.instructor setAverageRating:averageRating];
                [self.instructor setTotalRatings:totalRatings];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self populateTableData];
                    [self.tableView reloadData];
                    self.tableView.alwaysBounceVertical = NO;
                });
            }] resume];
    
}

-(void) populateTableData {
    [self.instructorData removeAllObjects];
    NSArray *name = [[NSArray alloc] initWithObjects:[self.instructor fullName], nil];
    NSArray *office = [[NSArray alloc] initWithObjects:[self.instructor office], nil];
    NSArray *phone = [[NSArray alloc] initWithObjects:[self.instructor phone], nil];
    NSArray *email = [[NSArray alloc] initWithObjects:[self.instructor email], nil];
    NSArray *ratings = [[NSArray alloc] initWithObjects:[self.instructor averageRating], [NSNumber numberWithInteger: [self.instructor totalRatings]], nil];
    NSArray *ratingArray = [[NSArray alloc] initWithObjects:ratings, nil];
    
    [self.instructorData addObject:name];
    [self.instructorData addObject:office];
    [self.instructorData addObject:phone];
    [self.instructorData addObject:email];
    [self.instructorData addObject:ratingArray];
    [self.tableView reloadData];
}

#pragma mark TableView methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = [self.instructorData objectAtIndex:section];
    return [array count];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.view setNeedsDisplay];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 4)
    {
        RatingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ratingCell"];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RatingViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            [cell.rating setMaxRating:5];
        }
        
        NSArray *array = [self.instructorData objectAtIndex:indexPath.section];
        NSArray *ratings = [array objectAtIndex:indexPath.row];
        NSNumber *averageRating = [ratings objectAtIndex:0];
        NSString *totalRatings = [NSString stringWithFormat:@"%@", [ratings objectAtIndex:1]];
        float decimalValue = [averageRating floatValue] - [averageRating integerValue];
        
        if (decimalValue > 0.66) {
            averageRating = [NSNumber numberWithInteger:([averageRating integerValue] + 1)];
        } else if(decimalValue > 0.33){
            averageRating = [NSNumber numberWithFloat:([averageRating integerValue] + 0.5)];
        } else {
            averageRating = [NSNumber numberWithFloat:[averageRating integerValue]];
        }
        
        [cell.rating setRating:[averageRating floatValue]];
        cell.ratingLabel.text = totalRatings;
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        
        NSArray *array = [self.instructorData objectAtIndex:indexPath.section];
        cell.textLabel.text = [array objectAtIndex:indexPath.row];
        
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 4 || section == 5) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 2, (tableView.frame.size.width/2), 18)];
        [label setFont:[UIFont boldSystemFontOfSize:14]];
        [view addSubview:label];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button addTarget:self
                   action:@selector(buttonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        
        [view setBackgroundColor:[UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0f]];
        
        if (section == 4) {
            [label setText:@"Rating"];
            [button setTitle:@"Rate" forState:UIControlStateNormal];
            CGSize stringSize = [@"Rate" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
            float buttonXPosition = tableView.frame.origin.x + tableView.frame.size.width - stringSize.width - 5;
            [button setFrame:CGRectMake(buttonXPosition, 2, stringSize.width, 18)];
        } else {
            [label setText:@"Comments"];
            [button setTitle:@"View Comments" forState:UIControlStateNormal];
            CGSize stringSize = [@"View Comments" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
            float buttonXPosition = tableView.frame.origin.x + tableView.frame.size.width - stringSize.width - 5;
            [button setFrame:CGRectMake(buttonXPosition, 2, stringSize.width, 18)];
        }
        return view;
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.instructorData count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return @"Instructor Name";
    }
    if(section == 1)
    {
        return @"Office";
    }
    if(section == 2)
    {
        return @"Phone Number";
    }
    if(section == 3)
    {
        return @"Email";
    }
    if(section == 4)
    {
        return @"Rating";
    }
    if(section == 5)
    {
        return @"Comments";
    }
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.section < 4);
}

- (void) buttonClicked:(UIButton*)sender {
    [self.tableView setScrollEnabled:NO];
    NSString *buttonName = sender.titleLabel.text;
    if ([buttonName isEqualToString:@"Rate"]) {
        RateViewController *rateVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RateViewController"];
        rateVC.instructorName = self.instructor.fullName;
        rateVC.delegate = self;
        [self.navigationController pushViewController:rateVC animated:YES];
    }
}

- (void)RateViewWasDismissedWithValue:(NSInteger)value {
    [self.tableView setScrollEnabled:YES];
    
    NSString * url = [NSString stringWithFormat:@"http://bismarck.sdsu.edu/rateme/rating/%@/%ld", self.instructor.instructorId, (long)value];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &error];
                NSNumber *averageRating = [NSNumber numberWithFloat:[[jsonResponse objectForKey:@"average"] floatValue]];
                NSInteger totalRating = [[jsonResponse objectForKey:@"totalRatings"]integerValue];
                
                [self.instructor setAverageRating:averageRating];
                [self.instructor setTotalRatings:totalRating];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self populateTableData];
                    [self.tableView reloadData];
                });
            }] resume];
    
}

- (void)RateViewWasDismissed
{
    [self.tableView setScrollEnabled:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"instructorToComments"]) {
        CommentsViewController *viewController = (CommentsViewController *)segue.destinationViewController;
        viewController.instructor = self.instructor;
    }
}


@end
