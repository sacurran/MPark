//
//  Forwarding.h
//  MitchellPark
//
//  Created by Mitchell on 4/17/13.
//  Copyright (c) 2013 Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Forwarding : UIViewController
{}
    - (id) init;

//extern NSString* email;
//extern NSString* name;
//extern NSString* type;
//extern NSString* number;
//extern NSString* cvs;
//extern NSDate* expire;
//extern NSString* zipcode;
//extern NSString* defaultLot;
//extern NSString* currentLot;
//extern int currentNumber;

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


@end
