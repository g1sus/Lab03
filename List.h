//
//  Animo.h
//  Lab03
//
//  Created by Jesus Antonio Hernandez Mendez on 04/02/15.
//  Copyright (c) 2015 BTICs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface List : UIViewController<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

//TableView
@property (strong, nonatomic) IBOutlet UITableView *tblDatos;
@property (strong, nonatomic) IBOutlet UILabel *lblTitulo;

//Actions
- (IBAction)actBack:(id)sender;

- (IBAction)actEdit:(id)sender;

- (IBAction)actDelete:(id)sender;

@end
