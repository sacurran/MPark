//
//  Forwarding.m
//  MitchellPark
//
//  Created by Mitchell on 4/17/13.
//  Copyright (c) 2013 Mitchell. All rights reserved.
//

#import "Forwarding.h"

@implementation Forwarding


-(id) init
{
    self=[super init];
    if(self)
    {
        
    }
    return self;
}
+(void) set:(NSString*) key:(id) object
{
     NSUserDefaults *userDefaults= [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:object forKey:key];
    [userDefaults synchronize];
}

+ (NSString*) name{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"name"];
}

+(void) SetName:(NSString*) n
{
    [self set:@"name" :n];
}

+ (NSString*) type{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"type"];
}

+(void) SetType:(NSString*) t
{
    [self set:@"type" :t];
}

+ (NSString*) number{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"number"];
}

+(void) SetNumber:(NSString*) n
{
   [self set:@"number" :n];
}
+ (NSString*) cvs{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"cvs"];
}

+(void) SetCvs:(NSString*) c
{
    [self set:@"cvs" :c];
}
+ (NSDate*) expire{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"expire"]!=nil)
        return [NSDate date];
    else
        return [[NSUserDefaults standardUserDefaults] objectForKey:@"expire"];
}

+(void) SetExpiration:(NSDate*) e
{
    [self set:@"expire" :e];
}
+ (NSString*) zipcode{
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"zipcode"];
}

+(void) SetZip:(NSString *)z
{
    [self set:@"zipcode" :z];
}

+ (NSString*) defaultLot{
   return [[NSUserDefaults standardUserDefaults] stringForKey:@"defaultLot"];
}

+(void) SetDefaultLot:(NSString *)d
{
    [self set:@"defaultLot" :d];
}

+ (NSString*) email{
   
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
}

+(void) SetEmail:(NSString*) e
{
 [self set:@"email" :e];
}
+ (NSString*) currentLot{
    
    return [[NSUserDefaults standardUserDefaults] stringForKey:@"currentLot"];
}

+(void) SetCurrentLot:(NSString *)l
{
    [self set:@"currentLot":l];
}
+ (int) currentNumber{
    
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"currentNumber"] intValue];
}

+(void) SetCurrentNumber:(int)num
{
    id var = [NSNumber numberWithInteger: num];
    [self set:@"currentNumber":var];
}
+ (float) moneyOwed{
    
    return [[NSUserDefaults standardUserDefaults] floatForKey:@"moneyOwed"];
}

+(void) SetMoneyOwed:(float)num
{
    id var = [NSNumber numberWithFloat: num];
    [self set:@"moneyOwed":var];
}
+ (NSDate*) paidThrough{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"paidThrough"];
}

+(void) SetPaidThrough:(NSDate*)d
{
    [self set:@"paidThrough":d];
}


+ (void)ChargeCC{
    //do something here
    
}

@end

