//
//  WorkWindowViewController.m
//  WhereAmI+UISegmentControl
//
//  Created by admin on 10.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "WorkWindowViewController.h"
#import "Map1ViewController.h"
@interface WorkWindowViewController ()

@end

@implementation WorkWindowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //Инициализирую UISegmentedControl
    segConMaps = [[UISegmentedControl alloc] init];//TODO Это не обязательно если я уже связал segConMaps с xib?
    [segConMaps addTarget:self action:@selector(segValChange:) forControlEvents:UIControlEventTouchUpInside];//TODO вопрос аналогичен выше стоящему
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//настраиваю действие на segValChangr
-(IBAction)segValChange:(id)sender //TODO ничего не происходит?
{
    if (segConMaps.selectedSegmentIndex==0) {
        by.text =@"first";
        
    }
    if (segConMaps.selectedSegmentIndex==1) {
        by.text =@"second";
    }
}




@end
