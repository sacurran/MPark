//
//  sendEmailViewController.h
//  sendEmail
//
//  Created by Marissa Belcher on 4/26/13.
//  Copyright (c) 2013 Marissa Belcher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKPSMTPMessage.h"
//#import <MessageUI/MessageUI.h>
//#import <MessageUI/MFMailComposeViewController.h>
//#import <MessageUI/MFMessageComposeViewController.h>

/*@interface sendEmailViewController : UIViewController <MFMailComposeViewControllerDelegate>
- (IBAction)showEmail:(id)sender;
-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error;*/
@interface Email : UIViewController<SKPSMTPMessageDelegate>

@property /*(weak, nonatomic)*/ IBOutlet UIButton *sendButton;

-(void)sendEmail: (NSString*)EmailID :(int)spotNumber :(NSString*)time :(NSString*)lotNumber :(NSString*)amount;
-(IBAction)sendMail:(id)sender;

@end

