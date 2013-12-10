//
//  Map1ViewController.m
//  WhereAmI+UISegmentControl
//
//  Created by admin on 10.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "Map1ViewController.h"
#import "MapPoint.h" //TODO мне подключать MapPoint.h здесь или в .h?? Где правильнее?? (в чем разница?) если в Map1ViewController.h подключаю MapPoint.h то могу и там и в .m создавать экземпляры mapPointa а если только в .m подключаю хэдер MapPoint то соответственно только здесь могу работать с экземплярами
@interface Map1ViewController ()

@end

@implementation Map1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDistanceFilter:kCLDistanceFilterNone];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];//TODO Если убираю locationManeger все-равно происходит поиск моего местоположения (то есть при использовании UIMapView мне он не нужен???) и Вообще правильно ли я его разместил (может лучше было бы его разместить в делегате приложения?)ммм нет наверное я не прав дальше в -(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation я его применяю
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [worldMap setShowsUserLocation:YES];//Запускаю поиск местоположения пользователя
    [worldMap setDelegate:self];//Устанавливаю делегатом wiorlMap данный класс
     worldMap.mapType = MKMapTypeHybrid;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Metods for delegate UITextField
//Этот метод для делегата UITextField что происходит при активации UITextField  //TODO уточнить правиьлно ли я понял (кажется это совсем другое)
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    // [textField resignFirstResponder];
    return YES;
}


-(void)findLocation //метод активации locationManager + запуск ИНдикатора
{
    [locationManager startUpdatingLocation];
    [mapIndicator startAnimating];
    [textField setHidden:YES];
}



#pragma mark Metods for delegate MKMapView


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation //Это метод для делегата MKMapView в моем случае я произвожу "зуммирование" карты
{
    CLLocationCoordinate2D coord = [userLocation coordinate]; //принимаю координаты
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);//создаю регион соответствующий окрестностям север-ют (250 метров) юг-восток (250 метров) для coord
    [worldMap setRegion:region animated:YES]; //вывожу на карту данный регион используя анимацию
    
}

#pragma mark Metods for delegate CLLocationManager

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@",newLocation);
    NSTimeInterval t = [[newLocation timestamp]timeIntervalSinceNow];
    if (t< -180) {
        return;
    }
    [self foundLocation:newLocation];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

-(void)foundLocation:(CLLocation *)loc1
{
    CLLocationCoordinate2D coord = [loc1 coordinate];
    MapPoint *mp = [[MapPoint alloc] initWithCoordinate:coord title:[textField text]];
    //TODO Не понимаю почему идет ошибка (когда начинаю применять метод initWithCoordinate:coord title:[textField text]) из MapPoint (не мог приметить данный метод пока в .h не подключил хэдер MapPoit.h и не создал там MapPoint *mp) в WhereAmI такая ошибка всегда (посмотреть)
    
    
    [worldMap addAnnotation:mp];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldMap setRegion:region animated:YES];
    [textField setText:@""];
    [mapIndicator stopAnimating];
    [textField setHidden:NO];
    [locationManager stopUpdatingLocation];
}


@end