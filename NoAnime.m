//
//  NoAnime.m
//  MPark
//
//  Created by Steffi Curran on 4/27/13.
//  Copyright (c) 2013 Steffi Curran. All rights reserved.
//

#import "NoAnime.h"

@implementation NoAnime

- (id)init
{
	self = [super init];
	if (self)
	{
	}
    
	return self;
}

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
	self = [super initWithIdentifier:identifier source:source destination:destination];
	if (self)
	{
	}
    
	return self;
}

- (void)perform
{
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dest = (UIViewController *) self.destinationViewController;
	UINavigationController *navController = src.navigationController;
    
	[navController pushViewController:dest animated:NO];
}
- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier
{
    return self;
}

@end
