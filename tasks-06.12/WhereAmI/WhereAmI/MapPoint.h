//
//  MapPoint.h
//  WhereAmI
//
//  Created by admin on 06.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject <MKAnnotation>
{
    NSString *title;
    CLLocationCoordinate2D coordinate;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

@end