//
//  ViewController.h
//  timetotea
//
//  Created by Oleh Podhornyi on 18.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OPClient.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;

@property (strong, nonatomic) OPClient* user;

- (IBAction)addProfileImage:(UIButton *)sender;

@end

