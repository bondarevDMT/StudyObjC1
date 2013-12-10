//
//  FirstViewController.h
//  UISegmentedControl
//
//  Created by admin on 10.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface FirstViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *worldMap;
    IBOutlet UISegmentedControl *segmentControl;
}
-(IBAction)segment:(id)sender;
@end
