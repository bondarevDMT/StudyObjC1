//
//  WorkWindowViewController.h
//  WhereAmI+UISegmentControl
//
//  Created by admin on 10.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
//TODO КАк сделать чтобы здесь не объявлять UISegmentedControl *segConMaps??
@interface WorkWindowViewController : UIViewController
{
   IBOutlet UISegmentedControl *segConMaps;
    IBOutlet UILabel *by;
}


-(IBAction)segValChange:(id)sender;
@end
