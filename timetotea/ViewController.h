//
//  ViewController.h
//  timetotea
//
//  Created by Oleh Podhornyi on 18.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OPClient.h"

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

#pragma mark - Global vars

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;

@property (strong, nonatomic) OPClient* user;
@property (strong, nonatomic) NSMutableArray* arrayWithPhotos;
@property (assign, nonatomic) NSUInteger imageID;
//@property (strong,nonatomic) UITouch* touch;

#pragma mark - UIControls

//Controls
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastName;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;

- (IBAction)addProfileImage:(UIButton *)sender;
- (IBAction)continueButton:(UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@end

