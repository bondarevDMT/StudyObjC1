//
//  HypnosisView.m
//  Hypnosister
//
//  Created by admin on 10.12.13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

-(void)drawRect:(CGRect)rect
{
    //Определяю местоположение моего view и размеры
    CGRect bounds = [self bounds];//создаю структуру разметов для моего view
    CGPoint center; //Создаю центр моего view
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    float maxRadius = hypotf(bounds.size.width, bounds.size.height) / 2.0;//максимальный радиус от центра
    
    //Начинаю рисовать
    CGContextRef context = UIGraphicsGetCurrentContext();//создаю контекст
    CGContextSetLineWidth(context, 10); //Задаю толщину для линий
    [[UIColor lightGrayColor] setStroke]; //Задаю цвет для линий
    //рисую канонические круги
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius-=20) {
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI*2.0, YES);
        CGContextStrokePath(context);
    }
    //Создаю надпись
    NSString *text = @"You are getting sleppy"; //текст
    UIFont *font = [UIFont boldSystemFontOfSize:28];//шрифт
    CGRect textRect; //структуру для положения и размеров текста
    //инициализация структуры textRect
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    //цвет для текста
    [[UIColor blackColor] setFill];
    //Установка тени - должна быть смещена на 4 вправо и на 3 вниз. Цыет темно-серый с радиусом размытия 2
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    //рисую тень
    [text drawInRect:textRect withFont:font];
}



@end
