//
//  BookCover.h
//  Paging_ObjC
//
//  Created by Linda Chan on 21/01/2015.
//

#import <UIKit/UIKit.h>

@interface BookCover : UICollectionViewCell

@property (nonatomic) UIImageView* cover_image;
@property (nonatomic) NSDictionary* image;
@property (nonatomic) NSString* image_name;
@end
