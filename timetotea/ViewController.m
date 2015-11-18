//
//  ViewController.m
//  timetotea
//
//  Created by Oleh Podhornyi on 18.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property(strong, nonatomic) NSString* pathProfileImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addProfileImage:(UIButton *)sender {
    
    NSString* profilePath = @"";
    
    self.pathProfileImage = profilePath;
    
    NSData*  imageProfileData = [NSData dataWithContentsOfFile:self.pathProfileImage];
    
    self.profileImage = [UIImage imageWithData:imageProfileData];
}
@end
