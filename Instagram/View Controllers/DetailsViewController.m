//
//  DetailsViewController.m
//  Instagram
//
//  Created by Emma Qian on 7/10/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

#import "DetailsViewController.h"
#import "YelpManager.h"
#import "ParseUI.h"
#import "DateTools.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet PFImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventLabel;
@property (weak, nonatomic) IBOutlet PFImageView *profileImage;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPost];
    YelpManager *yelpManager = [YelpManager new];
    [yelpManager getEvents:[NSString stringWithFormat:@"%f", self.post.latitude] withLongitude:[NSString stringWithFormat:@"%f", self.post.longitude] withCompletion:^(NSDictionary *categories, NSError *error) {
        NSArray *arr = categories[@"events"];
        if (arr.count > 0) {
            NSDictionary *dict = arr[0];
            self.eventLabel.text = dict[@"name"];
            self.eventLabel.numberOfLines = 0;
            [self.eventLabel sizeToFit];
        }
        else {
            self.eventLabel.text = @"None";
        }
    }];

}

- (void)setPost {
    self.photoImageView.file = self.post[@"image"];
    [self.photoImageView loadInBackground];
    self.captionLabel.text = self.post.caption;
    self.nameLabel.text = self.post.author.username;
    NSLog(@"%@", self.post.createdAt);
    self.timeLabel.text = self.post.createdAt.shortTimeAgoSinceNow;
    self.profileImage.file = [self.post.author valueForKey:@"profileImage"];
    self.profileImage.layer.masksToBounds = YES;
    self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2;
    [self.profileImage loadInBackground];
    [self.likeButton setTitle: [NSString stringWithFormat:@"%@",self.post.likeCount] forState: UIControlStateNormal];
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

- (IBAction)likeButton:(id)sender {
}
@end
