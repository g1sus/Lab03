//
//  NewViewController.h
//  Lab03
//
//  Created by Jesus Antonio Hernandez Mendez on 04/02/15.
//  Copyright (c) 2015 BTICs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"


// para poder trabajar con la camara necesitamos esta linea ...<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate>

@interface New : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate>


//Fields
@property (strong, nonatomic) IBOutlet UITextField *inputName;

@property (strong, nonatomic) IBOutlet UITextField *inputAnimo;

@property (strong, nonatomic) IBOutlet UITextField *inputYoutube;

//buttons
@property (strong, nonatomic) IBOutlet UIButton *btnBackList;
@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIButton *btnBack;
@property (strong, nonatomic) IBOutlet UIButton *btnAct;


//ImageView
@property (strong, nonatomic) IBOutlet UIImageView *inputImgview;


//Actions
- (IBAction)btnSave:(id)sender;
- (IBAction)btnBack:(id)sender;
- (IBAction)btnPhoto:(id)sender;
- (IBAction)btnAct:(id)sender;
- (IBAction)btnBackList:(id)sender;



@end
