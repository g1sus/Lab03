//
//  NewViewController.m
//  Lab03
//
//  Created by Jesus Antonio Hernandez Mendez on 04/02/15.
//  Copyright (c) 2015 BTICs. All rights reserved.
//

#import "New.h"
#import <QuartzCore/QuartzCore.h>

UIAlertView *alert;

@interface New ()

@end


@implementation New

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.inputName.delegate = self;
    self.inputAnimo.delegate = self;
    self.inputYoutube.delegate = self;
    // Do any additional setup after loading the view.
    if(idTemp != nil){
        
        self.btnBackList.hidden = NO;
        self.btnBack.hidden = YES;
        self.btnSave.hidden = YES;
        self.btnAct.hidden = NO;

        
        
        NSMutableArray *dato;
        dato = [[DBManager getSharedInstance]consultaDB:[NSString stringWithFormat: @"select agendaid, nombre, estado, youtube, foto FROM agenda WHERE agendaid=%@;", idTemp]];
        self.inputName.text = [dato objectAtIndex:1];
        self.inputAnimo.text = [dato objectAtIndex:2];
        self.inputYoutube.text = [dato objectAtIndex:3];
        self.inputImgview.image = [UIImage imageWithData:[dato objectAtIndex:4]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSave:(id)sender {
    NSString *nombre = self.inputName.text;
    NSString *estado = self.inputAnimo.text;
    NSString *youtube = self.inputYoutube.text;
    UIImage *imageData=UIImagePNGRepresentation([self.inputImgview image]);
    if((nombre.length == 0)||(estado == 0)||(youtube == 0)){
        alert = [[UIAlertView alloc] initWithTitle:@"Alto!"
                                           message:@"Debes llenar todos los campos!!!"
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles: nil];
        [alert show];
    }
    else{
        if([[DBManager getSharedInstance]insertaDB:nombre estado:estado youtube:youtube foto:imageData]){
            [self performSegueWithIdentifier:@"New to Home" sender:self];
        }
    }
}

- (IBAction)btnBack:(id)sender {
    [self performSegueWithIdentifier:@"New to Home" sender:self];
}

- (IBAction)btnPhoto:(id)sender {
    alert = [[UIAlertView alloc] initWithTitle:@"Fotografia"
                                       message:@"Que desea hacer?"
                                      delegate:self
                             cancelButtonTitle:@"Cancelar"
                             otherButtonTitles:@"Camara", @"Carrete", nil];
    [alert show];
}

- (IBAction)btnAct:(id)sender {
    NSString *nombre = self.inputName.text;
    NSString *estado = self.inputAnimo.text;
    NSString *youtube = self.inputYoutube.text;
    UIImage *imageData=UIImagePNGRepresentation([self.inputImgview image]);
    if((nombre.length == 0)||(estado == 0)||(youtube == 0)){
        alert = [[UIAlertView alloc] initWithTitle:@"Alto!"
                                           message:@"Debes llenar todos los campos!!!"
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles: nil];
        [alert show];
    }
    else{
        if([[DBManager getSharedInstance]actualizaDB:nombre estado:estado youtube:youtube foto:imageData idagenda:idTemp]){
            [self performSegueWithIdentifier:@"New to Home" sender:self];
        }
    }
}
- (IBAction)btnBackList:(id)sender {
    [self performSegueWithIdentifier:@"NewtoListado" sender:self];
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
    {
        if(buttonIndex == 0)
        {
            NSLog(@"Cancelar");
        }
        else if(buttonIndex == 1)
        {
            NSLog(@"Camara");
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:NULL];
        }
        else if(buttonIndex == 2)
        {
            NSLog(@"Carrete");
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:picker animated:YES completion:NULL];
        }
    }

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
        UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
        self.inputImgview.image = chosenImage;
        [picker dismissViewControllerAnimated:YES completion:NULL];
    }
    
    - (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
        [picker dismissViewControllerAnimated:YES completion:NULL];
    }

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
}
- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    int animatedDistance;
    int moveUpValue = textField.frame.origin.y+ textField.frame.size.height;
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = 216-(460-moveUpValue-5);
    }
    else
    {
        animatedDistance = 162-(320-moveUpValue-5);
    }
    if(animatedDistance>0)
    {
        const int movementDistance = animatedDistance;
        const float movementDuration = 0.3f;
        int movement = (up ? -movementDistance : movementDistance);
        [UIView beginAnimations: nil context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}



@end
