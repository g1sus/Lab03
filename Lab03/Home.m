//
//  ViewController.m
//  Lab03
//
//  Created by Jesus Antonio Hernandez Mendez on 03/02/15.
//  Copyright (c) 2015 BTICs. All rights reserved.
//

#import "Home.h"

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actNew:(id)sender {
    [self performSegueWithIdentifier:@"Home to New" sender:self];
}

- (IBAction)actEdit:(id)sender {
    [self performSegueWithIdentifier:@"Home to Lista" sender:self];
}

- (IBAction)actClean:(id)sender {
    [self performSegueWithIdentifier:@"Home to Lista" sender:self];
}

- (IBAction)actList:(id)sender {
    [self performSegueWithIdentifier:@"Home to Share" sender:self];
}
@end
