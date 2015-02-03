//
//  BookCover.m
//  Paging_ObjC
//
//  Created by Linda Chan on 21/01/2015.
//

#import "BookCover.h"

@implementation BookCover
@synthesize image_name;

//-(void)setImage_name:(NSString *)image_name:(NSDictionary *)image{
//    _image = image;
//}


-(id) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.cover_image = [[UIImageView alloc] init];
        self.image_name =@"";
        
        self.cover_image.image = [UIImage imageNamed:self.image_name];

        [self.contentView addSubview:self.cover_image];
    }
    
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.cover_image.frame = self.contentView.bounds;
}


@end
