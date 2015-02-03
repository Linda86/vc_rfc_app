//
//  PageViewController.m
//  HandOff_ObjC
//
//  Linda Chan

#import "PageViewController.h"
#import "PageDataViewController.h"

@interface PageViewController () <UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray *contentImages;
@property (nonatomic, strong) UIPageViewController *pageViewController;

@end

@implementation PageViewController
@synthesize contentImages;

#pragma mark -
#pragma mark View Lifecycle

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self createPageViewController];
    [self setupPageControl];
}

- (void) createPageViewController
{
    contentImages = @[@"nature_pic_1.png",
                      @"nature_pic_2.png",
                      @"nature_pic_3.png",
                      @"nature_pic_4.png"];
    
    UIPageViewController *pageController = [self.storyboard instantiateViewControllerWithIdentifier: @"PageViewController"];
    pageController.dataSource = self;
    
    if([contentImages count])
    {
        NSArray *startingViewControllers = @[[self itemControllerForIndex: 0]];
        [pageController setViewControllers: startingViewControllers
                                 direction: UIPageViewControllerNavigationDirectionForward
                                  animated: NO
                                completion: nil];
    }
    
    self.pageViewController = pageController;
    [self addChildViewController: self.pageViewController];
    [self.view addSubview: self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController: self];
}

- (void) setupPageControl
{
    [[UIPageControl appearance] setPageIndicatorTintColor: [UIColor grayColor]];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor: [UIColor whiteColor]];
    [[UIPageControl appearance] setBackgroundColor: [UIColor darkGrayColor]];
}

#pragma mark -
#pragma mark UIPageViewControllerDataSource

- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerBeforeViewController:(UIViewController *) viewController
{
    PageDataViewController *itemController = (PageDataViewController *) viewController;
    
    if (itemController.pageIndex > 0)
    {
        return [self itemControllerForIndex: itemController.pageIndex-1];
    }
    
    return nil;
}

- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerAfterViewController:(UIViewController *) viewController
{
    PageDataViewController *itemController = (PageDataViewController *) viewController;
    
    if (itemController.pageIndex+1 < [contentImages count])
    {
        return [self itemControllerForIndex: itemController.pageIndex+1];
    }
    
    return nil;
}

- (PageDataViewController *) itemControllerForIndex: (NSUInteger) itemIndex
{
    if (itemIndex < [contentImages count])
    {
        PageDataViewController *pageItemController = [self.storyboard instantiateViewControllerWithIdentifier: @"PageDataViewController"];
        pageItemController.pageIndex = itemIndex;
        
        [pageItemController setImageName:contentImages[itemIndex]];
        return pageItemController;
    }
    
    return nil;
}

#pragma mark -
#pragma mark Page Indicator

- (NSInteger) presentationCountForPageViewController: (UIPageViewController *) pageViewController
{
    return [contentImages count];
}

- (NSInteger) presentationIndexForPageViewController: (UIPageViewController *) pageViewController
{
    return 0;
}

@end
