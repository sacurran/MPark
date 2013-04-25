//
//  Forwarding.h
//  MitchellPark
//
//  Created by Mitchell on 4/17/13.
//  Copyright (c) 2013 Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Forwarding : UIViewController
{
}
- (id) init;
+(void) set:(NSString*) key:(id) object;


    + (NSString*) defaultLot;
    + (void) SetDefaultLot:(NSString*) d;
    + (NSString*)type;
    + (void)SetType:(NSString*)t;
    + (NSString*)name;
    + (void)SetName:(NSString*)n;
    + (NSString*)number;
    + (void)SetNumber:(NSString*)n;
    + (NSString*)cvs;
    +(void)SetCvs:(NSString*)c;
    + (NSString*)zipcode;
    +(void)SetZip:(NSString*)zip;
    +(NSDate*)expire;
    +(void) SetExpiration:(NSDate*) e;
    + (NSString*)email;
    + (void)SetEmail:(NSString*)e;
    + (NSString*)currentLot;
    + (void)SetCurrentLot:(NSString*)l;
    + (int)currentNumber;
    + (void)SetCurrentNumber:(int)num;
+ (float) moneyOwed;
+(void) SetMoneyOwed:(float)num;
+(NSDate*) paidThrough;
+(void) SetPaidThrough:(NSDate*)d;

@end
