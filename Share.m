//
//  Share.m
//  Lab03
//
//  Created by Jesus Antonio Hernandez Mendez on 04/02/15.
//  Copyright (c) 2015 BTICs. All rights reserved.
//

#import "Share.h"
#import "ShareList.h"

NSMutableArray *ListadoDatos;
int ListadoIndice;
int indice = nil;



@interface Share ()

@end

@implementation Share

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController{
    ListadoDatos = [[DBManager getSharedInstance]listDB:@"select agendaid, nombre, estado, youtube, foto from agenda"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)actBack:(id)sender {
    [self performSegueWithIdentifier:@"Share to Home" sender:self];
}

- (IBAction)actMore:(id)sender {
    if(idTemp != nil){
        [self performSegueWithIdentifier:@"Share to Detail" sender:self];
    }

}

- (IBAction)actShare:(id)sender {
    if(idTemp != nil){
        NSMutableArray *dato = ListadoDatos[indice];
        NSString *strMsg;
        NSArray *activityItems;
        UIImage *imgShare;
        UIActivityViewController *actVC;
        imgShare = [UIImage imageWithData:[dato objectAtIndex:4]];
        strMsg = [NSString stringWithFormat: @"Comparte un contacto, se llama %@ y su estado es: %@", [dato objectAtIndex:1], [dato objectAtIndex:2]];
        activityItems = @[imgShare, strMsg];
        //Init activity view controller
        actVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
        actVC.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
        [self presentViewController:actVC animated:YES completion:nil];
        
    }
}



/**********************************************************************************************
 Table Functions
 **********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ListadoDatos count];
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ShareList";
    ShareList *cell = (ShareList *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[ShareList alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSMutableArray *dato = ListadoDatos[indexPath.row];
    cell.lblName.text = [dato objectAtIndex:1];
    cell.lblAnimo.text = [dato objectAtIndex:2];
    cell.picture.image = [UIImage imageWithData:[dato objectAtIndex:4]];
    CALayer * l = [cell.picture layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:30.0];
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *dato = ListadoDatos[indexPath.row];
    ListadoIndice = indexPath.row;
    idTemp = [dato objectAtIndex:0];
    self.lblTitulo.text = [dato objectAtIndex:1];
}
@end
