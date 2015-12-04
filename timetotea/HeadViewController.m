//
//  HeadViewController.m
//  timetotea
//
//  Created by Oleh Podhornyi on 26.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import "HeadViewController.h"

@interface HeadViewController ()

@end

@implementation HeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"name - %@, ln - %@, dob - %@, ms - %@, em - %@, pn - %@, hs - %@, adr - %@",
          self.headUser.name, self.headUser.lastName, [self.headUser.dateOfBirth descriptionWithLocale:[NSLocale systemLocale]], self.headUser.martialStatus, self.headUser.electronicMailAdress, self.headUser.contactNumber, self.headUser.homeSite, self.headUser.adress);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(OPClient*) pushUserToHeadView:(OPClient*) user {
    self.headUser = user;
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

@end
