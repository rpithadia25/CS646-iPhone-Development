//
//  ViewController.m
//  Assignment5
//
//  Created by Rakshit Pithadia on 11/4/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Cell = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: Cell];
    if (cell == nil) {
        
    }
    return cell;
}

@end
