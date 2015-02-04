//
//  Detail.h
//  Lab03
//
//  Created by Jesus Antonio Hernandez Mendez on 04/02/15.
//  Copyright (c) 2015 BTICs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Detail : UIViewController

//Labels
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblAnimo;



//Image View
@property (strong, nonatomic) IBOutlet UIImageView *imgPhoto;


//WebView
@property (strong, nonatomic) IBOutlet UIWebView *webVideo;


//Actions
- (IBAction)btnBacka:(id)sender;

@end
