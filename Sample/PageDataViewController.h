//
//  PageDataViewController.h
//  HandOff_ObjC
//
//
//

#import <UIKit/UIKit.h>

@interface PageDataViewController : UIViewController

// Item controller information
@property NSUInteger pageIndex;
@property (nonatomic) NSString *imageName;
@property (nonatomic) NSInteger pageCount;

// IBOutlets
@property (nonatomic, weak) IBOutlet UIImageView *contentImageView;
//- (NSUInteger)indexOfViewController:(PageDataViewController *)viewController;

//-(instancetype)initWithPageIndex:(NSInteger)pageIndex;
- (void) setImageName: (NSString *) name;

@end
