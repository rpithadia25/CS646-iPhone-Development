//
//  SecondViewController.m
//  Assignment4
//
//  Created by Rakshit Pithadia on 10/19/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Add a clear button for the urlField
    self.urlField.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Validate URL
- (BOOL) validateUrl: (NSString *) urlString
{
    
    NSString *urlRegEx = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:urlString];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self validateUrl:textField.text]) {
        [self loadRequestFromString:textField.text];
    }else if(![textField.text hasPrefix:@"http://"]){
        [self loadRequestFromString:[@"http://" stringByAppendingString:textField.text]];
    }
    [self.urlField resignFirstResponder];
    return NO;
}

- (void)loadRequestFromString:(NSString*)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}



@end
