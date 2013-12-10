//
//  WorkWindowViewController.h
//  WhereAmI
//
//  Created by admin on 06.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

//ViewController содержащий главный экран (делегат для карты и текстового поля)
@interface WorkWindowViewController : UIViewController <MKMapViewDelegate, UITextFieldDelegate, CLLocationManagerDelegate>

{
    CLLocationManager *locationManager;
    IBOutlet MKMapView *worldMap; //создаю карту и привязываю ее к nib
    IBOutlet UITextField *textField; //создаю поля для текстового ввода привязываю ее к nib
    IBOutlet UIActivityIndicatorView *mapIndicator; //создаю индикатор загрузки и привязываю ее к nib

}
-(void)findLocation; //данный метод будет говорить locationManager искать текущее местоположение. Также он будет обновлять пользовательский интерфейс, так чтобы пользователь не мог дважды вводить текст
-(void)foundLocation:(CLLocation *)loc;//Создает экземпляр MapPoint(класс содержащий координаты с подписью) также обрабатывает зум для карты
@end
