//
//  FirstViewController.m
//  UISegmentedControl
//
//  Created by admin on 10.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CLLocationManager *locationManager = [CLLocationManager new];
        [locationManager setDistanceFilter:kCLDistanceFilterNone];
        [locationManager setDistanceFilter:kCLLocationAccuracyBest];
        [locationManager startUpdatingLocation];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [worldMap setShowsUserLocation:YES];
    [worldMap setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark metods for MapView Delegate

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation //Это метод для делегата MKMapView в моем случае я произвожу "зуммирование" карты
{
    CLLocationCoordinate2D coord = [userLocation coordinate]; //принимаю координаты
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);//создаю регион соответствующий окрестностям север-ют (250 метров) юг-восток (250 метров) для coord
    [worldMap setRegion:region animated:YES]; //вывожу на карту данный регион используя анимацию
    [segmentControl addTarget:self action:@selector(segment:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mapk Metod for SegmentedController
-(IBAction)segment:(id)sender
{
    if (segmentControl.numberOfSegments==0) {
        [worldMap setMapType:MKMapTypeStandard];// для 0 индекса segmentcontroller (1ая вкладка) карта стандартная
        NSLog(@"man");
    }
    else {
        [worldMap setMapType:MKMapTypeHybrid]; // для дргугих вкладок карта типа - hybrid
    }
}

@end
