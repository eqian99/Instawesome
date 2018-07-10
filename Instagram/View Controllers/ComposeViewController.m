//
//  ComposeViewController.m
//  Instagram
//
//  Created by Emma Qian on 7/9/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

#import "ComposeViewController.h"
#import "Post.h"
#import "Mapkit/Mapkit.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *locationSwitch;
@property (weak, nonatomic) IBOutlet MKMapView *locationMap;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoImageView.image = self.photo;

}
- (IBAction)switchAction:(id)sender {
    if (self.locationSwitch.isOn) {
        [self.locationMap setHidden:NO];
    }
    else {
        [self.locationMap setHidden:YES];
    }
        
}

- (IBAction)shareAction:(id)sender {
    [Post postUserImage:self.photoImageView.image withCaption:self.composeLabel.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
    }];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)exitAction:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
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
