//
//  MyPageViewController.m
//  Paging_ObjC
//
//  Created by Linda Chan on 25/01/2015.
//

#import "MyPageViewController.h"
#import "PageViewController.h"

@interface MyPageViewController ()

@end

@implementation MyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    PageItemControllerData *startingPage = [PageItemControllerData pageItemControllerDataForPageIndex:self.startingIndex];
//    if (startingPage != nil)
//    {
//        [self setViewControllers:@[startingPage]
//                       direction:UIPageViewControllerNavigationDirectionForward
//                        animated:NO
//                      completion:NULL];
//    }

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

- (UIViewController *)pageViewController:(UIPageViewController *)pvc viewControllerBeforeViewController:(PageItemControllerData *)vc
{
    NSUInteger index = vc.pageIndex;
    return [PageItemControllerData pageItemControllerDataForPageIndex:index-1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pvc viewControllerAfterViewController:(PageItemControllerData *)vc
{
    NSUInteger index = vc.pageIndex;
    return [PageItemControllerData pageItemControllerDataForPageIndex:index+1];

}

@end
