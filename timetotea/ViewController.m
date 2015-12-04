//
//  ViewController.m
//  timetotea
//
//  Created by Oleh Podhornyi on 18.11.15.
//  Copyright © 2015 Oleh Podhornyi. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"


@interface ViewController () <UITextFieldDelegate>

@property (strong, nonatomic) OPClient* user;
@property (strong, nonatomic) UIScrollView* scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayWithPhotos = [[NSMutableArray alloc] init];
    self.imageID = 0;
    self.user = [[OPClient alloc] init];
    UIScrollView* tempScrollView = [[UIScrollView alloc] init];
    self.scrollView = tempScrollView;
    self.texscrollView = self.scrollView;
    //self.textScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 300.f, 300.f)];
        
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)keyboardWillShowNotification:(NSNotification *)aNotification {
    self.scrollView.scrollEnabled = YES;
    self.scrollView.frame = CGRectMake(0, 45, 320, 200);
    [self.scrollView setContentSize:CGSizeMake(320, 360)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for(UITouch* touch in touches) {
        //if(touch.view != self. || touch.view != self.lastNameTextField){
           [self.view endEditing:true];
        //}
    }
}
#pragma mark - UIImagePickerController

//take photo with a camera


- (IBAction)nameTextFieldChanged:(UITextField *)sender {
    self.user.name = sender.text;
    NSLog(@"%@", self.user.name);

}

- (IBAction)lastNameTextFiledChanged:(UITextField *)sender {
    self.user.lastName = sender.text;
    NSLog(@"%@", self.user.lastName);

}

- (IBAction)addProfileImage:(UIButton *)sender {
    
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - pushButton and saved options

- (IBAction)continueButton:(UIButton *)sender {
    NSLog(@"%@", self.user.name);
    NSLog(@"%@",self.user.lastName);

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

#pragma mark - Segue pushiewController

-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if([identifier isEqualToString:@"customSegueToViewController"]) {
        
        if([self.user.name length] == 0 || [self.user.lastName length] == 0) { /*[self.profileImage.image isEqual:[UIImage imageNamed:@"blank.png"]]) {*/
           
            return NO;
        }
   }
    return YES;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"customSegueToViewController"]) {
        MainViewController* mainVC = segue.destinationViewController;
        [mainVC pushUserToMainView:self.user];
    }
}

#pragma mark - UITextFieldDelegate

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:true];
    
    return YES;
}

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    self.scrollView.contentOffset = (CGPoint) {0, CGRectGetMinY(textField.frame)};
    self.scrollView.scrollEnabled = YES;
    self.scrollView.frame = CGRectMake(0, 45, 320, 200);
    [self.scrollView setContentSize:CGSizeMake(320, 400)];
    
    return YES;
}


-(BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

-(void) textFieldDidEndEditing:(UITextField *)textField {
   // self.textScrollView.contentOffset = (CGPoint){0, 0};
    NSLog(@"%@", self.user.name);
    NSLog(@"%@",self.user.lastName);
    self.scrollView.scrollEnabled = NO;
    self.scrollView.frame = CGRectMake(0, 45, 320, 500);
}

-(void) textFieldDidBeginEditing:(UITextField *)textField {
    
}



@end
