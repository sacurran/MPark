//
//  ViewController.h
//  Email Sent
//
//  Created by Marissa Belcher on 3/13/13.
//  Copyright (c) 2013 Marissa Belcher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Forwarding.h"
#import "SKPSMTPMessage.h"

@interface EmailSentViewController : UIViewController<SKPSMTPMessageDelegate>
{
    NSTimer *aTimer;
}
@property (weak, nonatomic) IBOutlet UIButton *StartTimerButton;
- (IBAction)startTimer:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *SendReceipt;
- (IBAction)sendReceipt:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *DoneButton;
@property (weak, nonatomic) IBOutlet UILabel *LotLabel;
@property (weak, nonatomic) IBOutlet UILabel *SpotLabel;
@property (weak, nonatomic) IBOutlet UILabel *PaymentLabel;
@property (weak, nonatomic) IBOutlet UILabel *PaidThroughLabel;


@end
