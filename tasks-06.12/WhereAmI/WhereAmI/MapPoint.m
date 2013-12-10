//
//  MapPoint.m
//  WhereAmI
//
//  Created by admin on 06.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint
@synthesize coordinate, title;

-(id) initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    if (self) {
        coordinate = c;
        [self setTitle:t];
    }
    return  self;
}

/*-(void)dealloc //TODO помечает как ошибка/
 {
 [title release];
 [super dealloc];
 }*/
@end

