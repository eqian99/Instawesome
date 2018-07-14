//
//  ComposeViewController.m
//  Instagram
//
//  Created by Emma Qian on 7/9/18.
//  Copyright © 2018 EmmaQian. All rights reserved.
//

#import "ComposeViewController.h"
#import "Post.h"
#import <CoreLocation/CoreLocation.h>
#import "MBProgressHUD.h"

@interface ComposeViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UISwitch *locationSwitch;
@property (strong, nonatomic) IBOutlet MKMapView *locationMap;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationMap.delegate = self;
    self.photoImageView.image = self.photo;
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 2.0;
    [self.locationMap addGestureRecognizer:lpgr];
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint touchPoint = [gestureRecognizer locationInView:self.locationMap];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.locationMap convertPoint:touchPoint toCoordinateFromView:self.locationMap];
    self.coord = touchMapCoordinate;
    MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
    annot.coordinate = touchMapCoordinate;
    [self.locationMap addAnnotation:annot];
    [self.locationMap setUserInteractionEnabled:NO];
}

- (IBAction)switchAction:(id)sender {
    if (self.locationSwitch.isOn) {
        [self.locationMap setHidden:NO];
    }
    else {
        [self.locationMap setHidden:YES];
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
}

- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    NSArray *annotations = [mapView annotations];
    [self.locationMap showAnnotations:annotations animated:TRUE];
}

- (void) addPin {
    
}

- (IBAction)shareAction:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [Post postUserImage:self.photoImageView.image withCaption:self.composeLabel.text withLatitude: self.coord.latitude withLongitude: self.coord.longitude withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self dismissViewControllerAnimated:true completion:nil];
    }];
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
