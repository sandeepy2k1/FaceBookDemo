//
//  ViewController.m
//  FaceBook
//
//  Created by Amit Suneja on 07/02/14.
//  Copyright (c) 2014 ids. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize controller;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Show Facebook" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];

	// Do any additional setup after loading the view, typically from a nib.
}
-(void)aMethod:(id)sender{
    NSLog(@"aaMethod");
    
    
   // [self fetchTimelineForUser:0];
    
    controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result){
        if (result == SLComposeViewControllerResultCancelled) {
            
            NSLog(@"Cancelled");
            
        } else
            
        {
            NSLog(@"Done");
        }
        
        [controller dismissViewControllerAnimated:YES completion:Nil];
    };
    controller.completionHandler =myBlock;
    
    //Adding the Text to the facebook post value from iOS
    [controller setInitialText:@"Paint Brush!"];
    
    //Adding the URL to the facebook post value from iOS
    [controller addURL:[NSURL URLWithString:@"http://www.mobile.safilsunny.com"]];
    
    //Adding the Text to the facebook post value from iOS
    [controller addImage:[UIImage imageNamed:@"exercisebg_with_brush.png"]];
    
    [self presentViewController:controller animated:YES completion:Nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
