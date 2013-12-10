//
//  BDAppDelegate.h
//  Hypnosister
//
//  Created by admin on 10.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"
@interface BDAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    HypnosisView *view;
}

@property (strong, nonatomic) UIWindow *window;

@end
