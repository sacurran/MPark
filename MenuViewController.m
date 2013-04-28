//
//  MainMenuViewController.m
//  MPark
//
//  Created by Steffi Curran on 3/13/13.
//  Copyright (c) 2013 Steffi Curran. All rights reserved.
//

#import "MenuViewController.h"


@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}
-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
-(void) viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if([[Forwarding name] isEqualToString:@""])
    {
        _AddTime.hidden=true;
        _NewPark.hidden=true;
        [_Settings setTitle:@"Please Complete Settings" forState:UIControlStateNormal];
    }
    if([[Forwarding currentLot] isEqualToString:@"" ])
    {
        _AddTime.hidden=true;
    }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
