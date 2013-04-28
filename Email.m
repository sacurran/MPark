//
//  sendEmailViewController.m
//  sendEmail
//
//  Created by Marissa Belcher on 4/26/13.
//  Copyright (c) 2013 Marissa Belcher. All rights reserved.
//

#import "Email.h"


@implementation Email


@synthesize sendButton;
//@synthesize overlayImage,spinner;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)sendMail:(id)sender
{
    //need to get email address that's stored, spot number, lot name, purchase total, and amount of time 
    NSString *EmailID = @"marissbe@umich.edu";
    [self sendEmail:EmailID :4 :@"3" :@"Cooley" :@"$4.00"];
}

//needs to add spot number, lot name, purchase total, and how many hours they purchased.
-(void)sendEmail: (NSString*)EmailID :(int)spotNumber :(NSString*)time :(NSString*)lotNumber :(NSString*)amount
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
    NSString *part2 = [NSString stringWithFormat:@"You have purchased %@ hours for spot %d in the %@ lot. Your total is %@",time,spotNumber,lotNumber,amount];
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
    
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
	
    NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
	
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Error" message:@"Sending Failed - Unknown Error :-("
                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
}

/*- (IBAction)showEmail:(id)sender {
        // Email Subject
        NSString *emailTitle = @"Test Email";
        // Email Content
        NSString *messageBody = @"iOS programming is so fun!";
        // To address
        NSArray *toRecipents = [NSArray arrayWithObject:@"marissbe@umich.edu"];
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        [mc setToRecipients:toRecipents];
        
        // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    }
    
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
    {
        
        switch (result)
        {
            case MFMailComposeResultCancelled:
                NSLog(@"Mail cancelled");
                break;
            case MFMailComposeResultSaved:
                NSLog(@"Mail saved");
                break;
            case MFMailComposeResultSent:
                NSLog(@"Mail sent");
                break;
            case MFMailComposeResultFailed:
                NSLog(@"Mail sent failure: %@", [error localizedDescription]);
                break;
            default:
                break;
        }
        
        // Close the Mail Interface
        [self dismissViewControllerAnimated:YES completion:NULL];
}*/

@end
