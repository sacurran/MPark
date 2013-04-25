//
//  Database.h
//  Mpark
//
//  Created by Marissa Belcher on 4/8/13.
//  Copyright (c) 2013 Marissa Belcher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Database : NSObject
{
    NSString *FirstName;
    NSString *LastName;
    NSString *EmailAddress;
    NSString *CardNumber;
    NSString *CardType;
    NSString *SecurityCode;
    NSString *LotName;
    int SpotNumber;
}

-(void)InsertParkData:(NSString *)LotName andMaxSpots:(int)MaxSpots;
-(NSArray*)GetLots;
-(BOOL)LotExists:(NSString *)CurLot andCurSpace:(int)CurSpace;
-(NSDate*)GetPaidDate:(NSString *)CurLot andCurSpace:(int)CurSpace;
-(void)AddPayment:(NSString *)CurLot andCurSpace:(int)CurSpace paidThrough:(NSDate*) paidThrough;

@end
