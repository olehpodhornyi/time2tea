//
//  OPImageLoader.h
//  timetotea
//
//  Created by Oleh Podhornyi on 18.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol ImageLoaderDelegate;


@interface ImageLoader : NSObject
@property (assign, nonatomic) id  delegate; // Свойство для задания делегата
@property(assign, nonatomic) int index; // Свойство для упрощения обработки полученной картинки в делегате
@property(strong, nonatomic) NSMutableData *activeDownloadData; // Буфер для данных

-(void)loadImage:(NSString *)imageURLString; // Метод, который грузит катринку.
// Принимает на вход URL на картинку

@end

@protocol ImageLoaderDelegate <NSObject>

-(void) appImageDidLoad:(UIImage*)image index:(int)index; // Метод делегата, вызываемый по получению файла

@end
