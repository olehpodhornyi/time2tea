//
//  HeadViewController.h
//  timetotea
//
//  Created by Oleh Podhornyi on 26.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OPClient.h"

@interface HeadViewController : UIViewController
@property (strong, nonatomic) OPClient* headUser;
-(OPClient*) pushUserToHeadView:(OPClient*) user ;
@end
