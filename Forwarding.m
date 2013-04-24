//
//  Forwarding.m
//  MitchellPark
//
//  Created by Mitchell on 4/17/13.
//  Copyright (c) 2013 Mitchell. All rights reserved.
//

#import "Forwarding.h"

@implementation Forwarding

static NSString* email=@"";
static NSString* name=@"";
static NSString* type=@"";
static NSString* number=@"";
static NSString* cvs=@"";
static NSDate* expire=nil;
static NSString* zipcode=@"";
static NSString* defaultLot=@"";
static NSString* currentLot=@"";
static int currentNumber=0;

-(id) init
{
    self=[super init];
    return self;
}

+ (NSString*) name{
    return name;
}

+(void) SetName:(NSString*) n
{
    if (name != n) {
    	name = [n copy];
    }
}

+ (NSString*) type{
    return type;
}

+(void) SetType:(NSString*) t
{
    if (type != t) {
    	type = [t copy];
    }
}
+ (NSString*) number{
    return number;
}

+(void) SetNumber:(NSString*) n
{
    if (number != n) {
    	number = [n copy];
    }
}
+ (NSString*) cvs{
    return cvs;
}

+(void) SetCvs:(NSString*) c
{
    if (cvs != c) {
    	cvs = [c copy];
    }
}
+ (NSDate*) expire{
    if(expire==nil)
        return [NSDate date];
    else
        return expire;
}

+(void) SetExpiration:(NSDate*) e
{
    if (expire != e) {
    	expire = [expire copy];
    }
}
+ (NSString*) zipcode{
    return defaultLot;
}

+(void) SetZip:(NSString *)z
{
    if (zipcode != z) {
        zipcode= [z copy];
    }
}

+ (NSString*) defaultLot{
    return defaultLot;
}

+(void) SetDefaultLot:(NSString *)d
{
    if (defaultLot != d) {
         defaultLot= [d copy];
    }
}

+ (NSString*) email{
   
    return email;
}

+(void) SetEmail:(NSString*) e
{
    if (email != e) {
    	email = [e copy];
    }
}
+ (NSString*) currentLot{
    
    return currentLot;
}

+(void) SetCurrentLot:(NSString *)l
{
    if (currentLot != l) {
    	currentLot = [l copy];
    }
}
+ (int) currentNumber{
    
    return currentNumber;
}

+(void) SetCurrentNumber:(int)num
{
    if (currentNumber != num) {
    	currentNumber = num;
    }
}


- (void)ChargeCC{
    //do something here
}

@end

