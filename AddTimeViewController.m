//
//  AddTimeViewController.m
//  MPark
//
//  Created by Steffi Curran on 3/13/13.
//  Copyright (c) 2013 Steffi Curran. All rights reserved.
//

#import "AddTimeViewController.h"

@interface AddTimeViewController ()

@end

static float pricePerMinute=1.4/60;

@implementation AddTimeViewController

-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
-(void) viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}
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
        [self.navigationController setNavigationBarHidden:NO animated:NO];
    d=[[Database alloc] init];
    
    NSString * lotName=[Forwarding currentLot];
    int parkingSpot=[Forwarding currentNumber];

    paidThrough=[d GetPaidDate:lotName andCurSpace:parkingSpot];
    
    amountOwed=0;
    timeAdded=0;
    
    
    self.ParkingLotLabel.text=lotName;
    self.SpotNumberLabel.text=[[NSNumber numberWithInt:parkingSpot] stringValue];
    
    self.Stepper.minimumValue=0;
    self.Stepper.maximumValue=500;
    self.Stepper.stepValue=15;
    self.Stepper.wraps = YES;
    self.Stepper.autorepeat = YES;
    self.Stepper.continuous = YES;
    amountOwed=pricePerMinute*self.Stepper.value;
    timeAdded=self.Stepper.value;
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yy HH:mm:ss";
    NSString* paidThroughString=[dateFormatter stringFromDate: paidThrough];
    self.PaidThroughLabel.text=paidThroughString;
    NSNumber * aO=[NSNumber numberWithFloat:amountOwed];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    self.AmountOwedLabel.text=[formatter stringFromNumber:aO];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperValueChanged:(id)sender {
    
    amountOwed=pricePerMinute*self.Stepper.value;
    timeAdded=self.Stepper.value;
    NSDate * newDate =[paidThrough dateByAddingTimeInterval:timeAdded*60];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yy HH:mm:ss";
    self.PaidThroughLabel.text=[dateFormatter stringFromDate: newDate];
    
    NSNumber * aO=[NSNumber numberWithFloat:amountOwed];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    self.AmountOwedLabel.text=[formatter stringFromNumber:aO];

}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    paidThrough=[paidThrough dateByAddingTimeInterval:timeAdded*60];
    [d AddPayment:[Forwarding currentLot] andCurSpace:[Forwarding currentNumber] paidThrough:paidThrough];
    [Forwarding SetMoneyOwed:amountOwed];
    [Forwarding SetPaidThrough:paidThrough];
    [Forwarding ChargeCC];
    return YES;
}


@end
