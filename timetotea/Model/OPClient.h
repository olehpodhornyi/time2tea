//
//  OPClient.h
//  timetotea
//
//  Created by Oleh Podhornyi on 18.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OPClient : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSDate* dateOfBirth;
@property (assign, nonatomic) int radius;
@property (nonatomic) NSString* contactNumber;
@property (nonatomic) NSString* electronicMailAdress;
@property (strong, nonatomic) NSString* martialStatus;
@property (strong, nonatomic) NSString* aboutInformation;
@property (strong, nonatomic) NSString* homeSite;
@property (strong, nonatomic) NSString* adress;

@property (strong, nonatomic) UIImage* profileImage;

-(void) simplyRegistration;

@end
