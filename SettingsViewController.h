//
//  ViewController.h
//  MitchellPark
//
//  Created by Mitchell on 3/13/13.
//  Copyright (c) 2013 Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "Forwarding.h"

@interface SettingsViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
{
    Database *d;
    NSArray* types;
    NSArray* lots;
    NSString* email;
    NSString* name;
    NSString* type;
    NSString* number;
    NSString* cvs;
    NSDate* expire;
    NSString* zipcode;
    NSString* defaultLot;
    CGFloat animatedDistance;
}
@property (weak, nonatomic) IBOutlet UILabel *LotLabel;
@property (weak, nonatomic) IBOutlet UILabel *TypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;
@property (weak, nonatomic) IBOutlet UIButton *Commit;
@property (weak, nonatomic) IBOutlet UITextField *DefaultLotField;
@property (weak, nonatomic) IBOutlet UITextField *NameField;
@property (weak, nonatomic) IBOutlet UITextField *NumberField;
@property (weak, nonatomic) IBOutlet UITextField *CvsField;
@property (weak, nonatomic) IBOutlet UITextField *BillingField;
@property (weak, nonatomic) IBOutlet UIButton *ExpirationSelect;
@property (weak, nonatomic) IBOutlet UIDatePicker *ExpirationPicker;
@property (weak, nonatomic) IBOutlet UIButton *TypeSelect;
@property (weak, nonatomic) IBOutlet UIButton *LotSelect;
@property (weak, nonatomic) IBOutlet UIPickerView *LotPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *TypePicker;
@property (weak, nonatomic) IBOutlet UITextField *EmailField;
- (IBAction)pressTypeSelect:(id)sender;
- (IBAction)pressExpirationSelect:(id)sender;
- (IBAction)pressLotSelect:(id)sender;
- (IBAction)editingDidBegin:(id)sender;
- (IBAction)editingDidEnd:(id)sender;
-(BOOL)validateCard:(NSString *)cardNumber;
- (BOOL)validateEmailWithString;
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender;

@end
