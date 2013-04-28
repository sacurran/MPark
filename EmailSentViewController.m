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
  //  NSTimeInterval deed = 5;//[Forwarding moneyOwed]/1.4 * 60 * 60;
    
  //  aTimer = [NSTimer scheduledTimerWithTimeInterval:deed target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)timerFired:(NSTimer *) theTimer
//
//{
//    
//    // this is the code that appears when the timer is up.  Do we want to repalce
//    
//    // this with a pop up or what exactly?  Let me know and I can add that in.
//    
//    NSLog(@"timerFired @ %@", [theTimer fireDate]);
//    
//}

//needs to add spot number, lot name, purchase total, and how many hours they purchased.
-(void)sendEmail: (NSString*)EmailID :(int)spotNumber:(NSString*)lotNumber :(float)amount
{
    SKPSMTPMessage *smtpTestMessage = [[SKPSMTPMessage alloc] init];
    smtpTestMessage.fromEmail = @"marissbe@umich.edu";
    smtpTestMessage.toEmail = EmailID;
    smtpTestMessage.relayHost = @"smtp.gmail.com";
    smtpTestMessage.requiresAuth = YES;
    smtpTestMessage.login = @"marissabelcher12@gmail.com";
    smtpTestMessage.pass = @"8044Mmb1112";
    smtpTestMessage.subject = @"Mpark Receipt";
    smtpTestMessage.wantsSecure = YES; // smtp.gmail.com doesn't work without TLS!
	
    // Only do this for self-signed certs!
    // smtpTestMessage.validateSSLChain = NO;
    smtpTestMessage.delegate = self;
	
    //email contents
    NSString *part1 = @"Thank you for using Mpark!";
    NSString *part2 = [NSString stringWithFormat:@"You have purchased %.02f hours for spot %d in the %@ lot. Your total is $%.02f",amount/1.4,spotNumber,lotNumber,amount];
    NSString *part3 = @"Have a nice day!!";
    NSString * bodyMessage =[NSString stringWithFormat:@"%@\n%@\n%@", part1, part2, part3];
	
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/html",kSKPSMTPPartContentTypeKey,
                               bodyMessage ,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];
	
    smtpTestMessage.parts = [NSArray arrayWithObjects:plainPart,nil];
	
    [smtpTestMessage send];
	
}

- (void)messageSent:(SKPSMTPMessage *)message
{
    //message has been successfully sent . you can notify the user of that and remove the wait overlay
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message Sent" message:@"Your receipt has been sent"
                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    _SendReceipt.hidden=true;
    
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
	
    NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
	
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Error" message:@"Sending Failed - Unknown Error :-("
                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
}


- (IBAction)sendReceipt:(id)sender {
    NSString *EmailID = [Forwarding email];
    [self sendEmail:EmailID :[Forwarding currentNumber]:[Forwarding currentLot]:[Forwarding moneyOwed]];
}
@end
