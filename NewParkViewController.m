//
//  NewParkViewController.m
//  MPark
//
//  Created by Steffi Curran on 3/13/13.
//  Copyright (c) 2013 Steffi Curran. All rights reserved.
//

#import "NewParkViewController.h"

@interface NewParkViewController ()

@end

@implementation NewParkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     lots = [[NSArray alloc] initWithObjects:@"Lot1", @"Lot2", @"Lot3", @"Lot4", @"Lot5", nil];
     self.NumberBox.keyboardType=UIKeyboardTypeDecimalPad;
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonDidPressed:)];
    UIBarButtonItem *flexableItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setItems:[NSArray arrayWithObjects:flexableItem,doneItem, nil]];
    self.NumberBox.inputAccessoryView = toolbar;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return lots.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [lots objectAtIndex:row];
}

@end
