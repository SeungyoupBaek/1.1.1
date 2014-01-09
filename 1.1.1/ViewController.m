//
//  ViewController.m
//  1.1.1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController
-(IBAction)addNewProduct:(id)sender{
    // add product to Model
    Model* model = [Model sharedModel];
    NSString* productName = self.textField.text;
    [model addProduct:productName];
    
    // reflect View
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:([model numberOfProduct]-1) inSection:0];
    NSArray* newRow = [NSArray arrayWithObject:indexPath];
    [self.table insertRowsAtIndexPaths:newRow withRowAnimation:UITableViewRowAnimationAutomatic];
    
    // refresh textField
    self.textField.text = @"";
    //[self.texField setText:@""];
    [self.textField resignFirstResponder];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    // remove Product in Model
    [[Model sharedModel] removeProductAt:(int)indexPath.row];
    
    // reflect View
    NSArray* rowForDelete = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:rowForDelete withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[Model sharedModel] numberOfProduct];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
    
    // get info from Model
    Model* model = [Model sharedModel];
    cell.textLabel.text = [model productAt:indexPath.row];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
