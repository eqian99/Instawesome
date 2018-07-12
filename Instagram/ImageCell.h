//
//  ImageCell.h
//  Instagram
//
//  Created by Emma Qian on 7/11/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI.h>

@interface ImageCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;

@end
