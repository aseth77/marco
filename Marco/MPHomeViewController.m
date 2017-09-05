//
//  MPHomeViewController.m
//  Marco
//
//  Created by Frank Cantelmi on 3/30/14.
//  Copyright (c) 2014 Sapota Technologies LLC. All rights reserved.
//

#import "MPHomeViewController.h"

@interface MPHomeViewController ()
@property (nonatomic, assign) NSInteger scopeIndex;
@end

@implementation MPHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scopeIndex = 0;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionReusableView *)collectionView: (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                        withReuseIdentifier:@"HomeHeaderCell"
                                                                               forIndexPath:indexPath];
    UILabel *scope = (UILabel *)[view viewWithTag:111];
    UISearchBar *searchBar = (UISearchBar *)[view viewWithTag:222];

    switch (self.scopeIndex) {
        case 0:
            scope.text = @"Everyone";
            searchBar.placeholder = @"search all users";
            break;
        case 1:
            scope.text = @"Friends";
            searchBar.placeholder = @"search my friends";
            break;
        default:
            scope.text = @"Me";
            searchBar.placeholder = @"search my stuff";
            break;
    }

    return view;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCell" forIndexPath:indexPath];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:12345];

    switch (arc4random() % 3)
    {
        case 2:
            imageView.image = [UIImage imageNamed:@"bubbleLargeUnselected"];
            break;
        case 1:
            imageView.image = [UIImage imageNamed:@"bubbleMediumUnselected"];
            break;
        default:
            imageView.image = [UIImage imageNamed:@"bubbleSmallUnselected"];
            break;
    }

    return cell;
}

- (IBAction)onSwipeGestureLeft:(id)sender
{
    self.scopeIndex += 1;
    self.scopeIndex %= 3;
    [self.collectionView reloadData];
}

- (IBAction)onSwipeGestureRight:(id)sender
{
    self.scopeIndex += 3;
    self.scopeIndex -= 1;
    self.scopeIndex %= 3;
    [self.collectionView reloadData];
}

@end
