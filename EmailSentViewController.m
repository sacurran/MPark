//
//  ViewController.m
//  Email Sent
//
//  Created by Marissa Belcher on 3/13/13.
//  Copyright (c) 2013 Marissa Belcher. All rights reserved.
//

#import "EmailSentViewController.h"

@interface EmailSentViewController ()

@end

@implementation EmailSentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    _LotLabel.text=[Forwarding currentLot];
    _SpotLabel.text=[NSString stringWithFormat:@"%i",[Forwarding currentNumber]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yy HH:mm:ss";
    _PaidThroughLabel.text=[dateFormatter stringFromDate: [Forwarding paidThrough]];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    _PaymentLabel.text=[formatter stringFromNumber:[NSNumber numberWithFloat:[Forwarding moneyOwed]]];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendReceipt:(id)sender {
    
}
- (IBAction)startTimer:(id)sender {
}
@end
