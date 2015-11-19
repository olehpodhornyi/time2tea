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

@property (strong, nonatomic) NSString* clientName;
@property (strong, nonatomic) NSString* clienLastName;

@property (strong, nonatomic) UIImage* profileImage;

-(void) simplyRegistration;

@end
