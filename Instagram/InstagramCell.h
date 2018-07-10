//
//  InstagramCell.h
//  Instagram
//
//  Created by Emma Qian on 7/9/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "ParseUI.h"

@interface InstagramCell : UITableViewCell
@property (strong, nonatomic) Post *post;
@property (weak, nonatomic) IBOutlet UILabel *captaionLabel;
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;

@end
