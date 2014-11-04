//
//  SecondViewController.h
//  Assignment4
//
//  Created by Rakshit Pithadia on 10/19/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UITextField *urlField;

@end

