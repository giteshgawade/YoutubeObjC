//
//  MenuBar.h
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 26/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuCell.h"
#import "HomeController.h"

@class HomeController;

@interface MenuBar : UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    UIView *_horizontalBar;
}

@property(nonatomic,strong) HomeController *homeController;
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) NSLayoutConstraint *horizontalBarLeftAnchorConstraint;
@end
