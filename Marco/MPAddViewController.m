//
//  MPAddViewController.m
//  Marco
//
//  Created by Frank Cantelmi on 4/13/14.
//  Copyright (c) 2014 Sapota Technologies LLC. All rights reserved.
//

#import "MPAddViewController.h"

@interface MPAddViewController () <UIActionSheetDelegate>
@end

@implementation MPAddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Add..."
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"Image", @"Link", @"Video" , nil];
    [sheet showFromTabBar:self.tabBarController.tabBar];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.tabBarController setSelectedIndex:0];
}

@end
