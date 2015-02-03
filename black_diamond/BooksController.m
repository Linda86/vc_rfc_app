//
//  BooksController.m
//  Paging_ObjC
//
//  Created by Linda Chan on 21/01/2015.
//

#import "BooksController.h"
#import "PageViewController.h"
#import "BookCover.h"

@interface BooksController ()

@property (nonatomic) NSArray* books;
@property (nonatomic) NSArray* book_names;

@end

@implementation BooksController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype) init{
    if (self = [super init]){
        
        
    }
    
    return self;
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //Resize cell depening on screen size
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat cell_width = screenRect.size.width/2;
    
    CGSize cellSize = CGSizeMake(cell_width-1, cell_width-1);
    
    return cellSize;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 1.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0f;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets inset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
    
    return inset;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    // Register cell classes
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[BookCover class] forCellWithReuseIdentifier:@"cover"];
    

    // Do any additional setup after loading the view.
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



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //Add cell with image
    //
//    NSUInteger row = [indexPath row];

//    BookCover *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cover" forIndexPath:indexPath];
//    UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"book_%lu", row+1]];
//    
//    myCell.cover_image.image = image;

//    return myCell;
    //
    //Add cell with label and color for now
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cover" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor grayColor];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(cell.bounds.size.width*0.35, cell.bounds.size.height*0.4, cell.bounds.size.width, 40)];

    title.textColor = [UIColor blackColor];
    title.text = [NSString stringWithFormat:@"Book %d", indexPath.row+1];
    
    [cell.contentView addSubview:title];
    return cell;
   }

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

// Uncomment this method to specify if the specified item should be selected
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {

//    NSDictionary* cover = self.books[indexPath.row];
    

//    contentController.contentImages = cover;
    
//     [self presentViewController:contentController animated:YES completion:nil];
//}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    ViewController* contentController = [[ViewController alloc] init];
      /*
       Add to main thread if slow loading time
      */
//    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
//        dispatch_async(dispatch_get_main_queue(), ^(void){
            UIViewController *VC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//            [self presentViewController:VC animated:YES completion:nil];
    [self.navigationController pushViewController:VC animated:YES];
//        });
//    });
    
}



/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
