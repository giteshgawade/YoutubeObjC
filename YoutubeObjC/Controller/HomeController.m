//
//  ViewController.m
//  YoutubeObjc
//
//  Created by Gitesh Gawade on 25/09/16.
//  Copyright © 2016 Gitesh Gawade. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()
{
    NSMutableArray *videos;
    NSArray *titlesArray;
    SettingsLauncher *settingsLauncher;
    UILabel *titleLabel;
}
@end

@implementation HomeController

static NSString *cellId = @"cellId";
static NSString *trendingCellId = @"trendingCellId";
static NSString *subscriptionCellId = @"subscriptionCellId";



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    titlesArray = [[NSArray alloc] initWithObjects:@"Home",@"Trending",@"Subscriptions",@"Account", nil];
    
    settingsLauncher = [[SettingsLauncher alloc] init];
    settingsLauncher.homeController = self;
    
    [self setupMenuBar];
    [self setupNavigationBar];
    [self setupCollectionView];
    
//    [self fetchVideos];

}

-(void)setupMenuBar
{
//    [self.navigationController setHidesBarsOnSwipe:true];
    
    menuBar = [[MenuBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    menuBar.homeController = self;
    [self.view addSubview:menuBar];
}

-(void)setupNavigationBar
{
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"Home";
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 32, self.view.frame.size.height)];
    titleLabel.text =@"Home";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = titleLabel;

    
    UIBarButtonItem *searchBarButton =[[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"search_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(handleSearch)];
    UIBarButtonItem *moreBarButton =[[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav_more_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(handleMore)];
    
    self.navigationItem.rightBarButtonItems = @[moreBarButton,searchBarButton];
}

-(void)setupCollectionView
{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[FeedCell class] forCellWithReuseIdentifier:cellId];
    [self.collectionView registerClass:[TrendingCell class] forCellWithReuseIdentifier:trendingCellId];
    [self.collectionView registerClass:[SubscriptionCell class] forCellWithReuseIdentifier:subscriptionCellId];

    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.minimumLineSpacing = 0;
    
    self.collectionView.collectionViewLayout = flowLayout;
    self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0);
    self.collectionView.pagingEnabled = true;
}

-(void)scrollToMenuIndex:(int)index
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    [self setTitleLabelForIndex:index];
}

-(void)handleSearch
{
}

-(void)handleMore
{
    [settingsLauncher showSettings];
}

-(void)showControllerForSetting:(Setting *)setting
{
    UIViewController *dummySettingsViewController = [[UIViewController alloc] init];
    dummySettingsViewController.view.backgroundColor = [UIColor whiteColor];
    dummySettingsViewController.navigationItem.title = [setting getSettingString:setting.name];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    [self.navigationController pushViewController:dummySettingsViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    int index = (int)targetContentOffset->x / (self.view.frame.size.width);
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    
    [menuBar.collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
    
    [self setTitleLabelForIndex:index];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    menuBar.horizontalBarLeftAnchorConstraint.constant = scrollView.contentOffset.x / 4;
}

-(void)setTitleLabelForIndex:(int)index
{
    titleLabel.text = [titlesArray objectAtIndex:index];
}

#pragma Mark CollectionViewDelegate/Datasource

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    switch (indexPath.row) {
        case 1:
             cell = [collectionView dequeueReusableCellWithReuseIdentifier:trendingCellId forIndexPath:indexPath];
            break;
        case 2:
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:subscriptionCellId forIndexPath:indexPath];
            break;
        default:
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
            break;
    }
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height - 50);
}



@end

