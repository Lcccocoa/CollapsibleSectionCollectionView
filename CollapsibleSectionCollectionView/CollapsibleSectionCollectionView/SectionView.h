//
//  SectionView.h
//  TestScrollList
//
//  Created by Lynn on 15/9/21.
//  Copyright (c) 2015年 Lynn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (nonatomic, strong) NSIndexPath *indexPath;/**< <#xxx#> */
@end
