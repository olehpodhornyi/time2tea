//
//  MainViewController.h
//  timetotea
//
//  Created by Oleh Podhornyi on 25.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OPClient.h"
#import "HeadViewController.h"

@interface MainViewController : UIViewController <UITextFieldDelegate>

-(OPClient*) pushUserToMainView:(OPClient*) user;
@property (strong, nonatomic) OPClient* userInMain;

//- (IBAction)dateofBirthpicker:(UIDatePicker *)sender;
- (IBAction)martialstatusEditingEnd:(UITextField *)sender;
- (IBAction)aboutTextField:(UITextField *)sender;

- (IBAction)emailTextFieldEditingDidEnd:(UITextField *)sender;
- (IBAction)phoneNumberEditingDidEnd:(UITextField *)sender;
- (IBAction)homesiteEditingDidEnd:(UITextField *)sender;
- (IBAction)adressEditingDidEnd:(UITextField *)sender;
- (IBAction)continueButton:(UIButton *)sender;

@end
