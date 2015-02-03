//
//  PageDataViewController.m
//  HandOff_ObjC
//
//

#import "PageDataViewController.h"

@interface PageDataViewController ()



@end

@implementation PageDataViewController
@synthesize pageIndex;
@synthesize imageName;
@synthesize contentImageView;

#pragma mark -
#pragma mark View Lifecycle


//
//- (instancetype)initWithPageIndex:(NSInteger)pageIndex
//{
//    self = [super initWithNibName:nil bundle:nil];
//    if (self != nil)
//    {
//        _pageIndex = pageIndex;
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    contentImageView.image = [UIImage imageNamed: imageName];
    
}

#pragma mark -
#pragma mark Content

- (void) setImageName: (NSString *) name{
    imageName = name;
    contentImageView.image = [UIImage imageNamed: imageName];
}

@end
