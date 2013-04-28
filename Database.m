//
//  Database.m
//  Mpark
//
//  Created by Marissa Belcher on 4/8/13.
//  Copyright (c) 2013 Marissa Belcher. All rights reserved.
//

#import "Database.h"

@implementation Database

//Initially inserts the number of spaces for each of the lots. This data will be used to see if the spot exists.
//Works!!
-(void)InsertParkData:(NSString *)lotName andMaxSpots:(int)MaxSpots
{
    for (int i = 2; i<= MaxSpots; i++)
    {
        PFObject *lotInfo = [PFObject objectWithClassName:@"LotInfo"];
        [lotInfo setObject:lotName forKey:@"LotName"];
        [lotInfo setObject:[NSNumber numberWithInt:i] forKey:@"spaceNumber"];
        [lotInfo saveInBackground];
    }
    NSLog(@"Done");
}

//Returns the list of parking lots.
//Works!!!
-(NSArray*)GetLots;
{
    NSArray *Lots = [NSArray arrayWithObjects:@"Cooley",@"BBB",@"Stamps",@"NAME",@"NCRB",nil];
    return Lots;
    
}

//Determines if a lot name and spot actually exist.
//It Works!!!
-(BOOL)LotExists:(NSString *)CurLot andCurSpace:(int)CurSpace
{
    BOOL Exists = true;
    PFQuery *query = [PFQuery queryWithClassName:@"LotInfo"];
    [query whereKey:@"LotName" equalTo:@"Cooley"];
    [query whereKey:@"spaceNumber" equalTo:[NSNumber numberWithInt:CurSpace]];
    
    //determining if there was an object returned from the query.
    PFObject *Spot = [query getFirstObject];
    NSString *score = [Spot objectForKey:@"LotName"];
    
    if (score == (id)[NSNull null] || score.length == 0 )
    {
        Exists = false;
    }
    
    return Exists;
}

//Returns the date/time of when someone paid for a parking spot.
//It Works!!
-(NSDate*)GetPaidDate:(NSString *)CurLot andCurSpace:(int)CurSpace
{
    NSDate *time = [NSDate date];
   
    PFQuery *query = [PFQuery queryWithClassName:@"ParkInfo"];
    [query whereKey:@"lotName" equalTo:CurLot];
    [query whereKey:@"spaceNumber" equalTo:[NSNumber numberWithInt:CurSpace]];
    PFObject *Time = [query getFirstObject];
    time = [Time objectForKey:@"date"];
   
    if (Time == nil)
    {
        NSLog(@"Went in here");
        time = [NSDate date];
    }
    
    return time;
}

//Adds the current payment of a parking spot.
//It Works!!!
-(void)AddPayment:(NSString *)CurLot andCurSpace:(int)CurSpace paidThrough:(NSDate*) paidThrough
{
    PFObject *parkInfo = [PFObject objectWithClassName:@"ParkInfo"];
    [parkInfo setObject:CurLot forKey:@"lotName"];
    [parkInfo setObject:[NSNumber numberWithInt:CurSpace] forKey:@"spaceNumber"];
    [parkInfo setObject:paidThrough forKey:@"date"];
    [parkInfo saveInBackground];
}

@end
