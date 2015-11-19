//
//  ViewController.m
//  timetotea
//
//  Created by Oleh Podhornyi on 18.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import "ViewController.h"



@interface ViewController () 


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayWithPhotos = [[NSMutableArray alloc] init];
    self.imageID = 0;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for(UITouch* touch in touches) {
        if(touch.view != self.nameTextField || touch.view != self.lastNameTextField){
           [self.view endEditing:true];
        }
    }
}
#pragma mark - UIImagePickerController

//take photo with a camera
- (IBAction)addProfileImage:(UIButton *)sender {
    
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)continueButton:(UIButton *)sender {
}

- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];
}


#pragma mark - UIImagePickerControllerDelegate
//Когда мы изменяем фото info[UIImagePickerControllerEditedImage]
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.profileImage.image = chosenImage;
    
    UIImage* originalImage = info[UIImagePickerControllerOriginalImage];
    
    if(chosenImage != originalImage){
        self.profileImage.image = chosenImage;
        self.user.profileImage = chosenImage;
        [self.arrayWithPhotos addObject:chosenImage];
        self.imageID = [self.arrayWithPhotos indexOfObject:chosenImage];
        
    }
    else {
        self.profileImage.image = originalImage;
        self.user.profileImage = originalImage;
        [self.arrayWithPhotos addObject:originalImage];
        self.imageID = [self.arrayWithPhotos indexOfObject:originalImage];
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
//Отмена загрузки
-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


@end
