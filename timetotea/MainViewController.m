//
//  MainViewController.m
//  timetotea
//
//  Created by Oleh Podhornyi on 25.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UIScrollView* scrollView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.userInMain.name);
    NSLog(@"%@",self.userInMain.lastName);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(OPClient*) pushUserToMainView:(OPClient*) user {
    self.userInMain = user;
    return user;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Segue pushiewController

-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if([identifier isEqualToString:@"toHeadSegueToViewController"]) {
        
        if([self.userInMain.name length] == 0 || [self.userInMain.lastName length] == 0) { /*[self.profileImage.image isEqual:[UIImage imageNamed:@"blank.png"]]) {*/
            
            return NO;
        }
    }
    return YES;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"toHeadSegueToViewController"]) {
        HeadViewController* headVC = segue.destinationViewController;
        [headVC pushUserToHeadView:self.userInMain];
    }
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for(UITouch* touch in touches) {
        //if(touch.view != self. || touch.view != self.lastNameTextField){
        [self.view endEditing:true];
        //}
    }
}


#pragma mark - Controls with data
/*
- (IBAction)dateofBirthpicker:(UIDatePicker *)sender {
    //self.userInMain.dateOfBirth = sender.date;
    [self.view endEditing:true];
}
*/
- (IBAction)martialstatusEditingEnd:(UITextField *)sender {
    self.userInMain.martialStatus = sender.text;
}

- (IBAction)aboutTextField:(UITextField *)sender {
    self.userInMain.aboutInformation = sender.text;
}
- (IBAction)emailTextFieldEditingDidEnd:(UITextField *)sender {
    self.userInMain.electronicMailAdress = sender.text;
}

- (IBAction)phoneNumberEditingDidEnd:(UITextField *)sender {
    self.userInMain.contactNumber = sender.text;
}

- (IBAction)homesiteEditingDidEnd:(UITextField *)sender {
    self.userInMain.homeSite = sender.text;
}

- (IBAction)adressEditingDidEnd:(UITextField *)sender {
    self.userInMain.adress = sender.text;
}

#pragma mark - Continue button

- (IBAction)continueButton:(UIButton *)sender {
    NSLog(@"name - %@, ln - %@, dob - %@, ms - %@, em - %@, pn - %@, hs - %@, adr - %@",
          self.userInMain.name, self.userInMain.lastName, [self.userInMain.dateOfBirth descriptionWithLocale:[NSLocale systemLocale]], self.userInMain.martialStatus, self.userInMain.electronicMailAdress, self.userInMain.contactNumber, self.userInMain.homeSite, self.userInMain.adress);
}


#pragma mark - UITextFieldDelegate

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:true];
    return YES;
}

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}


-(BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

-(void) textFieldDidEndEditing:(UITextField *)textField {
    // self.textScrollView.contentOffset = (CGPoint){0, 0};
}




@end
