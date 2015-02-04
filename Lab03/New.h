//
//  NewViewController.h
//  Lab03
//
//  Created by Jesus Antonio Hernandez Mendez on 04/02/15.
//  Copyright (c) 2015 BTICs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface New : UIViewController

//Fields
@property (strong, nonatomic) IBOutlet UITextField *inputName;
@property (strong, nonatomic) IBOutlet UITextField *inputAnimo;

@property (strong, nonatomic) IBOutlet UITextField *inputYoutube;



//ImageView
@property (strong, nonatomic) IBOutlet UIImageView *inputImgview;


//Actions
- (IBAction)btnSave:(id)sender;
- (IBAction)btnBack:(id)sender;
- (IBAction)btnPhoto:(id)sender;



@end
