//
//  ViewController.m
//  MPark
//
//  Created by Steffi Curran on 3/13/13.
//  Copyright (c) 2013 Steffi Curran. All rights reserved.
//

#import "StartingViewController.h"

@interface StartingViewController ()

@end

@implementation StartingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFObject *testObject=[PFObject objectWithClassName:@"Test"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
