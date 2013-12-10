//
//  BDAppDelegate.m
//  Hypnosister
//
//  Created by admin on 10.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "BDAppDelegate.h"

//TODO Я создал view(моего класса hyposisView) в didFinishLaunchingWithOptions: а дальше мне надо его использовать в методе для делегата UIScrollViewDelegate как это сделать (в методе для делегата UIScrollViewDelegate он не видит  view) Я просто создал view для всего экземпляра класса делегата приложения (но это не то)
//TODO так и не понял для чего нужен scrollView чисто для зуммирования? тогда как понять схему со стр. 121 (думал, что scrollview для пролистывания)
@implementation BDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    CGRect wholeWindow = [[self window]bounds];//создаю CGRect размерами с window
    
   //Создаю SCrollView
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:wholeWindow];//создаю scroll размерами с рабочее окно
    [scrollview setDelegate:self];//устанавливаю делегатом scrollview делегата приложения
    //Cоздаю CGRect в два раза больших размеров, чем window
    CGRect reallyBigRect;
    reallyBigRect.origin = CGPointZero; //точка отсчета 0,0
    reallyBigRect.size.width = wholeWindow.size.width * 2.0;
    reallyBigRect.size.height = wholeWindow.size.height * 2.0;
    [scrollview setContentSize:reallyBigRect.size];
    //задаю центр для прокрутки
    CGPoint offset;
    //Так как у меня увеличение в 2 раза то точка прокрутки должна находится в центре одного из 4 (полученных при уведичении) window поэтому *0.5
    offset.x = wholeWindow.size.width * 0.5;
    offset.y = wholeWindow.size.height * 0.5;
    [scrollview setContentOffset:offset];
    [scrollview setMinimumZoomScale:0.5];
    [scrollview setMaximumZoomScale:5];
    //Создаю HypnosisView
    view = [[HypnosisView alloc] initWithFrame:reallyBigRect];//создаю hypnosisView увеличенным в 2 раза
    [view setBackgroundColor: [UIColor clearColor]];
    
    /*HypnosisView *view = [[HypnosisView alloc] initWithFrame:wholeWindow];//создаю view моего класса и размерами с рабочее окно
    [view setBackgroundColor:[UIColor clearColor]]; //задаю фоновый цвет для моего view*/ // ypnosisView  без UISCcrollView
    self.window.backgroundColor = [UIColor whiteColor];
    [[self window] addSubview:view]; // добавляю view на window
    [[self window] addSubview:scrollview]; // добавляю scrollView на дисплей
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];//TODO Хочу скрыть Status Bar но не выходит. Добавил в .plist ключ Status Bar is initially hidde YES аналогично не работает
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark metods for UIScrollViewDelegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return view;
}

@end
