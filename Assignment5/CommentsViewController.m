//
//  CommentsViewController.m
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/19/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "CommentsViewController.h"

@interface CommentsViewController ()

@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.text = @"Enter Your Comment";
    self.textView.delegate = self;
    self.commentsData = [[NSMutableArray alloc]init];
    UIBarButtonItem *addCommentButton = [[UIBarButtonItem alloc]
                                         initWithTitle:@"Add Comment"
                                         style:UIBarButtonItemStylePlain
                                         target:self
                                         action:@selector(addComment)];
    self.navigationItem.rightBarButtonItem = addCommentButton;
    
    [self fetchComments];
    
}

-(void)fetchComments
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *url = [NSString stringWithFormat:@"http://bismarck.sdsu.edu/rateme/comments/%@", self.instructor.instructorId];
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                NSArray *jsonResponse = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &error];
                
                for (int i = 0; i < [jsonResponse count]; i++) {
                    NSDictionary *comment = [jsonResponse objectAtIndex:i];
                    NSString *text = [comment objectForKey:@"text"];
                    [self.commentsData addObject:text];
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

-(IBAction)addComment
{
    [self.textView resignFirstResponder];
    
    NSString *comment = self.textView.text;
    NSData *commentData = [comment dataUsingEncoding:NSUTF8StringEncoding];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[commentData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://bismarck.sdsu.edu/rateme/comment/%@", self.instructor.instructorId]]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:commentData];
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    if (connection) {
        [self fetchComments];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.commentsData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
    }
    
    cell.textLabel.text = self.commentsData[indexPath.row];
    
    return cell;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.textView isFirstResponder] && [touch view] != self.textView) {
        [self.textView resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    self.textView.text = @"";
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    if(self.textView.text.length == 0){
        self.textView.text = @"Comment";
        [self.textView resignFirstResponder];
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
