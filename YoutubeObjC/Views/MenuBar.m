//
//  MenuBar.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 26/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "MenuBar.h"

@implementation MenuBar

static NSString *cellId = @"cellId";
static NSArray *imageNames;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imageNames = @[@"home", @"trending", @"subscriptions", @"account"];

        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor rgb:230 green:32 blue:31 alpha:1];
        
        self.backgroundColor = [UIColor blueColor];
        [_collectionView registerClass:[MenuCell class] forCellWithReuseIdentifier:cellId];
        
        [self addSubview:_collectionView];
        [self addConstraintsWithFormat:@"H:|[v0]|" onViews:@[_collectionView]];
        [self addConstraintsWithFormat:@"V:|[v0]|" onViews:@[_collectionView]];
        
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        [_collectionView selectItemAtIndexPath:selectedIndexPath animated:NO scrollPosition:0];
        
        _horizontalBar = [[UIView alloc] init];
        _horizontalBar.translatesAutoresizingMaskIntoConstraints = NO;
        _horizontalBar.backgroundColor = [UIColor whiteColor];
        [self addSubview:_horizontalBar];
        
        _horizontalBarLeftAnchorConstraint = [[_horizontalBar leftAnchor] constraintEqualToAnchor:self.leftAnchor];
        _horizontalBarLeftAnchorConstraint.active = YES;
        
        NSString *horizontalConstraintString = [NSString stringWithFormat:@"H:|[v0(%f)]",(self.frame.size.width/4)];
        
        [self addConstraintsWithFormat:horizontalConstraintString onViews:@[_horizontalBar]];
        [self addConstraintsWithFormat:@"V:[v0(4)]|" onViews:@[_horizontalBar]];
    }
    return self;
}

#pragma Mark CollectionViewDelegate/Datasource

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_homeController scrollToMenuIndex:(int)indexPath.item];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.imageView.image = [[UIImage imageNamed:[imageNames objectAtIndex:indexPath.item]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    cell.tintColor = [UIColor rgb:91 green:14 blue:13 alpha:1];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width / 5, self.frame.size.height);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

@end
