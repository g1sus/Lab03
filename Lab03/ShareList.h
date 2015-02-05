//
//  ShareList.h
//  Lab03
//
//  Created by Jesus Antonio Hernandez Mendez on 05/02/15.
//  Copyright (c) 2015 BTICs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareList : UITableViewCell

//imgView
@property (strong, nonatomic) IBOutlet UIImageView *picture;

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblAnimo;

@end
