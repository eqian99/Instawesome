//
//  InstagramCell.m
//  Instagram
//
//  Created by Emma Qian on 7/9/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

#import "InstagramCell.h"

@implementation InstagramCell

- (void)setPost:(Post *)post {
    _post = post;
    self.photoImageView.file = post[@"image"];
    [self.photoImageView loadInBackground];
    self.captaionLabel.text = post.caption;
}

@end
