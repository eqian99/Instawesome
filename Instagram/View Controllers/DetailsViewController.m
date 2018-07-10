//
//  DetailsViewController.m
//  Instagram
//
//  Created by Emma Qian on 7/10/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

#import "DetailsViewController.h"
#import "ParseUI.h"
#import "DateTools.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPost];
}

- (void)setPost {
    self.photoImageView.file = self.post[@"image"];
    [self.photoImageView loadInBackground];
    self.captionLabel.text = self.post.caption;
    self.nameLabel.text = self.post.author.username;
    NSLog(@"%@", self.post.createdAt);
    self.timeLabel.text = self.post.createdAt.shortTimeAgoSinceNow;
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

@end
