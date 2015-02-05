//
//  Share.h
//  Lab03
//
//  Created by Jesus Antonio Hernandez Mendez on 04/02/15.
//  Copyright (c) 2015 BTICs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface Share : UIViewController<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

//TableView

@property (strong, nonatomic) IBOutlet UITableView *tblDatos;



//Actions
- (IBAction)actBack:(id)sender;

- (IBAction)actMore:(id)sender;

- (IBAction)actShare:(id)sender;


@end
