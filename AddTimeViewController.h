//
//  AddTimeViewController.h
//  MPark
//
//  Created by Steffi Curran on 3/13/13.
//  Copyright (c) 2013 Steffi Curran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "Forwarding.h"

@interface AddTimeViewController : UIViewController
{
    Database * d;
    NSDate * paidThrough;
    float timeAdded;
    float amountOwed;
}

@property (weak, nonatomic) IBOutlet UILabel *ParkingLotLabel;
@property (weak, nonatomic) IBOutlet UILabel *SpotNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *PaidThroughLabel;
@property (weak, nonatomic) IBOutlet UILabel *AmountOwedLabel;
@property (weak, nonatomic) IBOutlet UIStepper *Stepper;
- (IBAction)stepperValueChanged:(id)sender;
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender;

@end
