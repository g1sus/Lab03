//
//  NewViewController.m
//  Lab03
//
//  Created by Jesus Antonio Hernandez Mendez on 04/02/15.
//  Copyright (c) 2015 BTICs. All rights reserved.
//

#import "New.h"

UIAlertView *alert;

@interface New ()

@end

@implementation New

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        alert = [[UIAlertView alloc] initWithTitle:@"Faltan campos!"
                                           message:@"Oops! Parece que no haz llenado todos los campos!"
                                          delegate:self
                                 cancelButtonTitle:@"Ok"
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

@end
