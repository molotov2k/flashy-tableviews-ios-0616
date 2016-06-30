//
//  FTTableViewController.m
//  flashy-tableviews
//
//  Created by Max Tkach on 6/30/16.
//  Copyright © 2016 Anvil. All rights reserved.
//

#import "FTTableViewController.h"
#import "UIScrollView+APParallaxHeader.h"
#import <SWTableViewCell.h>


@interface FTTableViewController () <APParallaxViewDelegate> {
    BOOL parallaxWithView;
}

@end

@implementation FTTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView addParallaxWithImage:[UIImage imageNamed:@"parallax.jpg"] andHeight:250];
//    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"CLICK ME" style:UIBarButtonItemStylePlain target:self action:@selector(toggle:)];
//    [self.navigationItem setRightBarButtonItem:barButton];

}

//- (void)toggle:(id)sender {
//    [self.tableView addParallaxWithImage:[UIImage imageNamed:@"parallax.jpg"] andHeight:250];
//    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"CLICK ME" style:UIBarButtonItemStylePlain target:self action:@selector(toggle:)];
//    [self.navigationItem setRightBarButtonItem:barButton];
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SWTableViewCell *cell = (SWTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"flashyCell" forIndexPath:indexPath];
    cell = [[SWTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"flashyCell"];
    cell.leftUtilityButtons = [self leftButtons];
    cell.rightUtilityButtons = [self rightButtons];
    //cell.delegate = self;
    //cell.title
    cell.textLabel.text = [NSString stringWithFormat:@"%li", indexPath.row];
    
    
    
    return cell;
}


- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                title:@"More"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                title:@"Delete"];
    
    return rightUtilityButtons;
}

- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                icon:[UIImage imageNamed:@"check@2x.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
                                                icon:[UIImage imageNamed:@"clock@2x.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                icon:[UIImage imageNamed:@"cross@2x.png"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
                                                icon:[UIImage imageNamed:@"list@2x.png"]];
    
    return leftUtilityButtons;
}



@end
