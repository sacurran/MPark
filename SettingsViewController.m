//
//  ViewController.m
//  MitchellPark
//
//  Created by Mitchell on 3/13/13.
//  Copyright (c) 2013 Mitchell. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;
@implementation SettingsViewController
-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
-(void) viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Before database init");
    d=[[Database alloc] init];
    NSLog(@"After database init");
    
    //Load init Data
   
    types=[NSArray arrayWithObjects:@"Visa", @"Mastercard", @"Discover", nil];
    lots=[d GetLots];
    email=[Forwarding email];
    name=[Forwarding name];
    type=[Forwarding type];
    number=[Forwarding number];
    cvs=[Forwarding cvs];;
    //Todo fix date
    expire=[Forwarding expire];
    zipcode=[Forwarding zipcode];
    defaultLot=[Forwarding defaultLot];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yy";
    _DateLabel.text=[dateFormatter stringFromDate: expire];

    //Text Fields
    _NameField.text=name;
    _NameField.delegate=self;
    _EmailField.text=email;
    _EmailField.delegate=self;
    _NumberField.text=number;
    _NumberField.delegate=self;
    _NumberField.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    _CvsField.text=cvs;
    _CvsField.delegate=self;
    _CvsField.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    _BillingField.text=zipcode;
    _BillingField.delegate=self;
    _BillingField.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    
    _ExpirationPicker.datePickerMode=UIDatePickerModeDate;
    
    _TypeLabel.text=type;
    _LotLabel.text=defaultLot;
    
    
    //Hide pickers
    _ExpirationPicker.hidden=true;
    _LotPicker.hidden=true;
    _TypePicker.hidden=true;
	
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressTypeSelect:(id)sender {
    if(_TypePicker.hidden)
    {
        _TypePicker.hidden=false;
        [_TypeSelect setTitle:@"Done"forState:UIControlStateNormal];
    }
    else
    {
        int row = [_TypePicker selectedRowInComponent:0];
        _TypePicker.hidden=true;
        [_TypeSelect setTitle:@"Select"forState:UIControlStateNormal];
        type=types[row];
        _TypeLabel.text=type;
    }
}

- (IBAction)pressExpirationSelect:(id)sender {
    if(_ExpirationPicker.hidden)
    {
        _ExpirationPicker.hidden=false;
        if(expire!=nil)
            _ExpirationPicker.date=expire;
        [_ExpirationSelect setTitle:@"Done"forState:UIControlStateNormal];
    }
    else
    {
        _ExpirationPicker.hidden=true;
        [_ExpirationSelect setTitle:@"Select"forState:UIControlStateNormal];
        expire=_ExpirationPicker.date;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        dateFormatter.dateFormat = @"MM/dd/yy";
        _DateLabel.text=[dateFormatter stringFromDate: expire];
    }
}

- (IBAction)pressLotSelect:(id)sender {
    if(_LotPicker.hidden)
    {
        _LotPicker.hidden=false;
        [_LotSelect setTitle:@"Done"forState:UIControlStateNormal];
    }
    else
    {
        int row = [_LotPicker selectedRowInComponent:0];
        _LotPicker.hidden=true;
        [_LotSelect setTitle:@"Select"forState:UIControlStateNormal];
        defaultLot=lots[row];
        _LotLabel.text=defaultLot;
    }
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView==_LotPicker)
        return lots.count;
    if(pickerView==_TypePicker)
        return types.count;
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView==_LotPicker)
        return [lots objectAtIndex:row];
    if(pickerView==_TypePicker)
        return [types objectAtIndex:row];
    return @"";
}
- (IBAction)editingDidBegin:(id)sender
{
    UITextField * textField=(UITextField*)sender;
    CGRect textFieldRect =
    [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [self.view.window convertRect:self.view.bounds fromView:self.view];
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y
    - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
    * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}
- (IBAction)editingDidEnd:(id)sender {
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
    
}

- (IBAction)touchOutOfKeyboard:(UITextField *)sender {
    
    [sender resignFirstResponder];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)validateCard:(NSString *)cardNumber

{
    
    int Luhn = 0;
    
    // I'm running through my string backwards
    
    for (int i=0;i<[cardNumber length]; i++)
        
    {
        
        NSUInteger count = [cardNumber length]-1; // Prevents Bounds Error and makes characterAtIndex easier to read
        
        int doubled = [[NSNumber numberWithUnsignedChar:[cardNumber characterAtIndex:count-i]] intValue] -48;
        
        if (i % 2)
            
        {doubled = doubled*2;}
        
        NSString *double_digit = [NSString stringWithFormat:@"%d",doubled];
        
        if ([[NSString stringWithFormat:@"%d",doubled] length] > 1)
            
        {   Luhn = Luhn + [[NSNumber numberWithUnsignedChar:[double_digit characterAtIndex:0]] intValue]-48;
            
            Luhn = Luhn + [[NSNumber numberWithUnsignedChar:[double_digit characterAtIndex:1]] intValue]-48;}
        
        else
            
        {Luhn = Luhn + doubled;}
        
    }
    
    if (Luhn%10 == 0) // If Luhn/10's Remainder is Equal to Zero, the number is valid
        
        return true;
    
    else
        
        return false;
    
}
- (BOOL)validateEmailWithString
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    NSMutableArray* errors=[[NSMutableArray alloc] init];
    bool valid=true;
    name=_NameField.text;
    number=_NumberField.text;
    cvs=_CvsField.text;
    zipcode=_BillingField.text;
    email=_EmailField.text;
    if([name isEqualToString:@""])
    {
        [errors addObject:@"Name is blank."];
        valid=false;
    }
    if([number isEqualToString:@""])
    {
        [errors addObject:@"Number is blank."];
        valid=false;
    }
    if([defaultLot isEqualToString:@""])
    {
        [errors addObject:@"Default lot is blank."];
        valid=false;
    }
    if([type isEqualToString:@""])
    {
        [errors addObject:@"Type is blank."];
        valid=false;
    }
    if(cvs.length!=3)
    {
        [errors addObject:@"CSV is wrong length. Should be 3."];
        valid=false;
    }
    if(zipcode.length!=5)
    {
        [errors addObject:@"Zipcode is wrong length. Should be 5."];
        valid=false;
    }
    if(![self validateEmailWithString])
    {
        [errors addObject:@"Invalid email."];
        valid=false;
    }
    if(![self validateCard:number])
    {
        [errors addObject:@"Invalid Credit Card Number."];
        valid=false;
    }
    if(valid)
    {
        [Forwarding SetName:name];
        [Forwarding SetNumber:number];
        [Forwarding SetCvs:cvs];
        [Forwarding SetZip:zipcode];
        [Forwarding SetDefaultLot:defaultLot];
        [Forwarding SetType:type];
        [Forwarding SetExpiration:expire];
        [Forwarding SetEmail:email];
        return YES;
    }
    NSMutableString* message=[NSMutableString string];
    for(NSUInteger i=0;i<errors.count;i++)
    {
        [message appendString:[errors objectAtIndex:i]];
        [message appendString:@"\n"];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Errors"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    return NO;
    
}


@end
