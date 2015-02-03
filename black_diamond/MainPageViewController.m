//
//  MainPageViewController.m
//  Paging_ObjC 3
//
//  Created by Linda Chan on 29/01/2015.
//  Copyright (c) 2015 Linda Chan All rights reserved.
//
#import "PageViewController.h"
#import "PageDataViewController.h"
#import "MainPageViewController.h"

@interface MainPageViewController ()
@property (readonly, nonatomic) PageViewController* pageController;

@end

@implementation MainPageViewController
@synthesize pageController = _pageController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
        // Do any additional setup after loading the view.
//    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    
    PageDataViewController *startingViewController = [self.pageController viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.pageViewController.dataSource = self.pageController;
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    
    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
//    CGRect pageViewRect = self.view.bounds;
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0);
//    }
//    self.pageViewController.view.frame = pageViewRect;
    
    [self.pageViewController didMoveToParentViewController:self];
    
    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
