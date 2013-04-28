//
//  MapViewController.m
//  MPark
//
//  Created by Steffi Curran on 4/27/13.
//  Copyright (c) 2013 Steffi Curran. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
{
    GMSMapView *mapView_;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)loadView {
    // Create a GMSCameraPosition
    float longi=-83.715928;
    GMSCameraPosition *camera =[GMSCameraPosition cameraWithLatitude:42.294001 longitude:longi zoom:14];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.mapType = kGMSTypeSatellite;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(42.293552, -83.717145);
    marker.title = @"BBB";
    marker.map = mapView_;
    
    GMSMarker *marker2 = [[GMSMarker alloc] init];
    marker2.position = CLLocationCoordinate2DMake(42.295008, -83.720257);
    marker2.title = @"NCRB";
    marker2.map = mapView_;
    
    GMSMarker *marker3 = [[GMSMarker alloc] init];
    marker3.position = CLLocationCoordinate2DMake(42.290867, -83.712586);
    marker3.title = @"Cooley";
    marker3.map = mapView_;
    
    GMSMarker *marker4 = [[GMSMarker alloc] init];
    marker4.position = CLLocationCoordinate2DMake(42.29404, -83.708637);
    marker4.title = @"NAME";
    marker4.map = mapView_;
    
    GMSMarker *marker5 = [[GMSMarker alloc] init];
    marker5.position = CLLocationCoordinate2DMake(42.292426, -83.717647);
    marker5.title = @"Stamps";
    marker5.map = mapView_;
}


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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
