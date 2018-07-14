//
//  InstagramCell.m
//  Instagram
//
//  Created by Emma Qian on 7/9/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

#import "InstagramCell.h"
#import "DateTools.h"

@implementation InstagramCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *profileTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapProfile:)];
    [self.profileImageView addGestureRecognizer:profileTapGestureRecognizer];
    [self.profileImageView setUserInteractionEnabled:YES];
}

- (void)setPost:(Post *)post {
    _post = post;
    self.photoImageView.file = post[@"image"];
    [self.photoImageView loadInBackground];
    self.captaionLabel.text = post.caption;
    self.nameLabel.text = post.author.username;
    self.timeLabel.text = post.createdAt.shortTimeAgoSinceNow;
    self.profileImageView.file = [post.author valueForKey:@"profileImage"];
    self.profileImageView.layer.masksToBounds = YES;
    [self.likeButton setTitle: [NSString stringWithFormat:@"%@",self.post.likeCount] forState: UIControlStateNormal];
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
    [self.profileImageView loadInBackground];
    self.locationLabel.text = [NSString stringWithFormat:@"%f, %f", post.latitude, post.longitude];
}
- (IBAction)didTapProfile:(id)sender {
    [self.delegate instagramCell:self didTap:self.post.author];
}

- (IBAction)didTapFavorite:(UIButton *)sender {
    NSLog(@"Hi");
    sender.selected = !sender.selected;
    if (!sender.selected) {
        [sender setImage:[UIImage imageNamed:@"favor-icon.png"] forState:UIControlStateNormal];
        [sender setSelected:NO];
        self.post.likeCount = [NSNumber numberWithInteger: [self.post.likeCount intValue] - 1];
    } else {
        [sender setImage:[UIImage imageNamed:@"favor-icon-red.png"] forState:UIControlStateSelected];
        [sender setSelected:YES];
        self.post.likeCount = [NSNumber numberWithInteger: [self.post.likeCount intValue] + 1];
    }
    [self.likeButton setTitle: [NSString stringWithFormat:@"%@",self.post.likeCount] forState: UIControlStateNormal];
    [self.post saveInBackground];
}


@end
