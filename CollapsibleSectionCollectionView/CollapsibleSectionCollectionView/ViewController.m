//
//  ViewController.m
//  TestScrollList
//
//  Created by Lynn on 15/7/28.
//  Copyright (c) 2015年 Lynn. All rights reserved.
//

#import "ViewController.h"
#import "SectionView.h"

@interface ViewController ()
@property (nonatomic, assign) int showSection;/**<  */
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showSection = -1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == self.showSection) {
        return 21;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SectionView *sv = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        [sv.btn addTarget:self action:@selector(tapHandler:) forControlEvents:UIControlEventTouchUpInside];
        sv.indexPath = indexPath;

        return sv;
    }
    return nil;
}

- (void)tapHandler:(UIButton *)sender
{
    SectionView *sv = (SectionView *)sender.superview;
    
    if ( _showSection != -1 ) {
        int section = _showSection;
        _showSection = -1;
        [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:section]];
        
        if (sv.indexPath.section == section) {
            return;
        }
    }
    
    _showSection = sv.indexPath.section;
    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:_showSection]];
}


@end
